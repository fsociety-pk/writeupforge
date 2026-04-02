#!/bin/bash

# WriteupForge Linux Installer - Simple Setup

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

# Create virtual environment
echo ""
echo -e "${BOLD}[+] Creating virtual environment...${NC}"
python3 -m venv venv
echo -e "${GREEN}[+] Virtual environment created${NC}"

# Activate virtual environment
echo -e "${BOLD}[+] Activating virtual environment...${NC}"
source venv/bin/activate
echo -e "${GREEN}[+] Virtual environment activated${NC}"

# Install dependencies in virtual environment
echo ""
echo -e "${BOLD}[+] Installing dependencies...${NC}"
pip install --upgrade pip
pip install -r requirements.txt
echo -e "${GREEN}[+] Dependencies installed${NC}"

# Create .env file
echo ""
echo -e "${BOLD}[+] Setting up API configuration${NC}"

if [ -f ".env" ]; then
    echo -e "${YELLOW}[!] .env file already exists${NC}"
    read -p "Do you want to replace it? (y/n): " replace_env
    if [ "$replace_env" != "y" ]; then
        echo "Keeping existing .env file"
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
    echo "You can add it later by editing .env file"
else
    echo "GROQ_API_KEY=$api_key" > .env
    chmod 600 .env
    echo -e "${GREEN}[+] API key saved to .env${NC}"
fi

echo ""
echo -e "${BOLD}${GREEN}Installation Complete!${NC}"
echo ""
echo -e "${BOLD}Next steps:${NC}"
echo ""
echo "[+] Activate the virtual environment:"
echo "    source venv/bin/activate"
echo ""
echo "[+] Run the application:"
echo "    python3 run.py --cli   (command-line)"
echo "    python3 run.py --gui   (graphical)"
echo ""
echo "[+] Generated reports saved in: output/"
echo ""
echo -e "${YELLOW}[!] You must run 'source venv/bin/activate' BEFORE running the app!${NC}"
echo ""
