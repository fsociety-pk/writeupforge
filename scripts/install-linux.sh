#!/bin/bash

# WriteupForge Linux Installer - System-Wide Installation

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

echo ""
echo -e "${BOLD}${GREEN}WriteupForge - Linux Installation${NC}"
echo ""

# Check if running as root (needed for system-wide install)
if [ "$EUID" -ne 0 ]; then 
    echo -e "${YELLOW}[!] This installer needs sudo permissions to install system-wide${NC}"
    echo "Please run with sudo:"
    echo "    sudo bash scripts/install-linux.sh"
    echo ""
    exit 1
fi

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}[ERROR] Python 3 is not installed!${NC}"
    echo "Install it with:"
    echo "  Ubuntu/Debian: sudo apt install python3 python3-pip python3-venv"
    echo "  Fedora/RHEL: sudo dnf install python3 python3-pip"
    echo "  Arch: sudo pacman -S python python-pip"
    exit 1
fi

PYTHON_VERSION=$(python3 --version 2>&1 | awk '{print $2}')
echo -e "${GREEN}[+] Python $PYTHON_VERSION found${NC}"

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo -e "${GREEN}[+] Installing from: $PROJECT_DIR${NC}"

# Create virtual environment
echo ""
echo -e "${BOLD}[+] Creating virtual environment...${NC}"
cd "$PROJECT_DIR"
python3 -m venv venv
echo -e "${GREEN}[+] Virtual environment created${NC}"

# Activate virtual environment
echo -e "${BOLD}[+] Activating virtual environment...${NC}"
source venv/bin/activate
echo -e "${GREEN}[+] Virtual environment activated${NC}"

# Install dependencies
echo ""
echo -e "${BOLD}[+] Installing dependencies...${NC}"
pip install --upgrade pip setuptools wheel
pip install -r requirements.txt
echo -e "${GREEN}[+] Dependencies installed (including groq)${NC}"

# Install the package in the venv
echo ""
echo -e "${BOLD}[+] Installing WriteupForge...${NC}"
pip install -e .
echo -e "${GREEN}[+] WriteupForge installed in virtual environment${NC}"

# Create system-wide wrapper script
echo ""
echo -e "${BOLD}[+] Creating system-wide command wrapper...${NC}"
cat > /usr/local/bin/fgwrite << 'WRAPPER_EOF'
#!/bin/bash
# WriteupForge - System-wide wrapper
# Automatically activates venv and runs fgwrite

# Try to get installation directory from stored path
if [ -f "/etc/writeupforge-path" ]; then
    INSTALL_DIR=$(cat /etc/writeupforge-path)
else
    # Fallback: try to detect from script location
    INSTALL_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../../" && pwd)"
    if [ ! -d "$INSTALL_DIR/scripts" ]; then
        INSTALL_DIR=""
    fi
fi

# If still not found, search common locations
if [ -z "$INSTALL_DIR" ] || [ ! -f "$INSTALL_DIR/venv/bin/activate" ]; then
    for path in /root/writeupforge ~/writeupforge /opt/writeupforge /home/*/writeupforge /home/*/Desktop/writesec /home/*/Desktop/WriteSec; do
        if [ -f "$path/venv/bin/activate" ]; then
            INSTALL_DIR="$path"
            break
        fi
    done
fi

if [ ! -f "$INSTALL_DIR/venv/bin/activate" ]; then
    echo "Error: WriteupForge installation not found"
    echo "Location checked: $INSTALL_DIR"
    echo "Please reinstall WriteupForge using:"
    echo "    sudo bash scripts/install-linux.sh"
    exit 1
fi

# Activate venv and run fgwrite
source "$INSTALL_DIR/venv/bin/activate"
cd "$INSTALL_DIR"
python3 -m cli "$@"
WRAPPER_EOF

chmod +x /usr/local/bin/fgwrite
echo -e "${GREEN}[+] Created /usr/local/bin/fgwrite${NC}"

# Store installation path for future reference
echo "$PROJECT_DIR" > /etc/writeupforge-path
echo -e "${GREEN}[+] Installation path registered${NC}"

# Deactivate venv
deactivate

# Create .env file
echo ""
echo -e "${BOLD}[+] Setting up API configuration${NC}"

if [ -f "$PROJECT_DIR/.env" ]; then
    echo -e "${YELLOW}[!] .env file already exists${NC}"
    read -p "Do you want to replace it? (y/n): " replace_env
    if [ "$replace_env" != "y" ]; then
        echo "Keeping existing .env file"
    else
        rm "$PROJECT_DIR/.env"
    fi
else
    # Prompt for API key
    echo ""
    echo -e "${BOLD}Get your free Groq API Key:${NC}"
    echo "Visit: https://console.groq.com/keys"
    echo ""
    read -sp "Paste your API Key here: " api_key
    echo ""

    if [ -z "$api_key" ]; then
        echo -e "${YELLOW}[!] No API key provided${NC}"
        echo "You can add it later by running: fgwrite --gui"
        echo "Then go to Settings and enter your API key"
    else
        echo "GROQ_API_KEY=$api_key" > "$PROJECT_DIR/.env"
        # Set permissions so the regular user can read it
        # Using 644 allows the file to be readable by all users, writable by owner only (root)
        chmod 644 "$PROJECT_DIR/.env"
        
        # Fix ownership so the actual user (not root) owns the file
        # When using sudo, $SUDO_USER contains the original user's name
        if [ ! -z "$SUDO_USER" ]; then
            # Transfer ownership from root to the user who ran sudo
            chown "$SUDO_USER:$SUDO_USER" "$PROJECT_DIR/.env"
            chmod 600 "$PROJECT_DIR/.env"
            echo -e "${GREEN}[+] API key saved to .env with secure permissions${NC}"
        else
            echo -e "${GREEN}[+] API key saved to .env (readable by current user)${NC}"
        fi
    fi
fi

echo ""
echo -e "${BOLD}${GREEN}✅ Installation Complete!${NC}"
echo ""
echo -e "${BOLD}You can now use WriteupForge from anywhere:${NC}"
echo ""
echo "  fgwrite                   (auto-detect mode)"
echo "  fgwrite --cli             (command-line mode)"
echo "  fgwrite --gui             (graphical mode)"
echo ""
echo -e "${GREEN}No need to activate virtual environment - just type 'fgwrite'!${NC}"
echo ""
echo "[+] Installation directory: $PROJECT_DIR"
echo "[+] Generated reports saved in: $PROJECT_DIR/output/"
echo ""
echo -e "${YELLOW}[!] After installation, close and reopen your terminal for changes to take effect${NC}"
echo ""
echo -e "${GREEN}Happy writing! 🎉${NC}"
echo ""
