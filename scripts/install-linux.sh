#!/bin/bash

# WriteupForge Linux Installer - Global Setup

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

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}[ERROR] Python 3 is not installed!${NC}"
    echo "Install it with:"
    echo "  Ubuntu/Debian: sudo apt install python3 python3-pip"
    echo "  Fedora/RHEL: sudo dnf install python3 python3-pip"
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

# Install the package in development mode - this creates the fgwrite command
echo ""
echo -e "${BOLD}[+] Installing WriteupForge as a system tool...${NC}"
pip install -e .
echo -e "${GREEN}[+] Installed! You can now use 'fgwrite' command${NC}"

# Create .env file
echo ""
echo -e "${BOLD}[+] Setting up API configuration${NC}"

if [ -f ".env" ]; then
    echo -e "${YELLOW}[!] .env file already exists${NC}"
    read -p "Do you want to replace it? (y/n): " replace_env
    if [ "$replace_env" != "y" ]; then
        echo "Keeping existing .env file"
        deactivate
        echo ""
        echo -e "${BOLD}${GREEN}Installation Complete!${NC}"
        echo ""
        echo -e "${BOLD}To use WriteupForge:${NC}"
        echo ""
        echo "[+] Activate virtual environment (one-time per session):"
        echo "    source $PROJECT_DIR/venv/bin/activate"
        echo ""
        echo "[+] Run command:"
        echo "    fgwrite                   (auto-detect mode)"
        echo "    fgwrite --cli             (command-line mode)"
        echo "    fgwrite --gui             (graphical mode)"
        echo ""
        echo "[+] Generated reports saved in: $PROJECT_DIR/output/"
        echo ""
        exit 0
    fi
fi

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
    echo "GROQ_API_KEY=$api_key" > .env
    chmod 600 .env
    echo -e "${GREEN}[+] API key saved to .env (secure permissions set)${NC}"
fi

# Deactivate venv at the end
deactivate

echo ""
echo -e "${BOLD}${GREEN}Installation Complete!${NC}"
echo ""
echo -e "${BOLD}To use WriteupForge:${NC}"
echo ""
echo "[+] First time: Activate virtual environment"
echo "    source $PROJECT_DIR/venv/bin/activate"
echo ""
echo "[+] Then run command (in any directory):"
echo "    fgwrite                   (auto-detect mode - GUI on Windows, CLI on Linux)"
echo "    fgwrite --cli             (command-line mode)"
echo "    fgwrite --gui             (graphical mode)"
echo ""
echo "[+] For future sessions:"
echo "    source $PROJECT_DIR/venv/bin/activate"
echo "    fgwrite"
echo ""
echo "[+] Generated reports saved in: $PROJECT_DIR/output/"
echo ""
echo -e "${GREEN}Happy writing! 🎉${NC}"
echo ""
