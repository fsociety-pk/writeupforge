# WriteupForge

Convert raw cybersecurity lab notes into professional, structured Markdown and PDF reports using AI.

**Platform Support**: Windows | Linux
**UI Options**: GUI (Graphical) | CLI (Command-line)

---

## Getting Your Groq API Key (Required First)

Before you install, you need a free Groq API key:

1. Visit: https://console.groq.com/keys
2. Click "Sign Up" (free account, takes 2 minutes)
3. Click "Create API Key"
4. Copy the key (you'll need it during installation)

**You will be prompted for this key during the installer!**

---

## Installation & Setup

**Quick Summary of Steps:**
[1] Clone the repository
[2] Prepare your API key (have it ready)
[3] Run the installer script

---

### For Linux Users

**Step 1: Clone the repository**
```bash
git clone https://github.com/thehusnain/writeupforge.git
cd writeupforge
```

**Step 2: Prepare your API key**
Make sure you have copied your Groq API key from https://console.groq.com/keys

**Step 3: Run the installer**
```bash
chmod +x scripts/install-linux.sh
sudo bash scripts/install-linux.sh
```

The installer will:
[+] Create Python virtual environment
[+] Install all dependencies  
[+] Ask for your Groq API key (paste it now!)
[+] Create system-wide `fgwrite` command
[+] Save API key to .env file

**Step 4: Start using it immediately!**
```bash
# Just type the command directly - no setup needed!
fgwrite --cli    # Command-line mode
fgwrite --gui    # Graphical mode
fgwrite          # Auto-detect mode
```

**That's it!** Just close and reopen your terminal, then you can use `fgwrite` from anywhere.

---

### For Windows Users

**Step 1: Clone the repository**
```
git clone https://github.com/thehusnain/writeupforge.git
cd writeupforge
```

**Step 2: Prepare your API key**
Make sure you have copied your Groq API key from https://console.groq.com/keys

**Step 3: Run the installer**
[+] Right-click: scripts/install-wizard.ps1
[+] Select: "Run with PowerShell"
[+] Click "Yes" when prompted (needs admin)

The installer will:
[+] Create virtual environment
[+] Install all dependencies
[+] Create .env file
[+] Create Desktop shortcut

**Step 4: Add your API key**
[+] Open the .env file in project folder
[+] Paste your Groq API key
[+] Save the file

**Step 5: Run the application**
[+] Click the Desktop shortcut, OR
[+] Use Start Menu > WriteupForge

---

## How to Use

### Running in CLI Mode
```bash
fgwrite --cli
```
[+] Enter writeup title
[+] Enter your name  
[+] Select platform (HackTheBox, TryHackMe, etc.)
[+] Select difficulty level
[+] Paste your notes (type DONE when finished)

### Running in GUI Mode
```bash
fgwrite --gui
```
[+] Fill in the form with your details
[+] Paste your lab notes
[+] Click "Generate Professional Report"

Reports are saved in the project folder: `output/` directory

---

## Project Structure

```
writeupforge/
├── scripts/               [Installation & Setup]
│   ├── install-wizard.ps1 [Windows installer]
│   ├── install-linux.sh   [Linux installer]
│   └── uninstall.bat      [Windows uninstall]
├── docs/                  [Documentation]
├── config/                [Config templates]
├── utils/                 [Helper modules]
├── main.py                [CLI mode]
├── main_gui.py            [GUI mode]
├── run.py                 [Application launcher]
├── ai_handler.py          [Groq API]
├── requirements.txt       [Dependencies]
└── .env                   [Your API key]
```

---

## Troubleshooting

### Error: "fgwrite: command not found"

Close and reopen your terminal. The installation adds the command to system PATH which requires a terminal restart.

If still not found:
```bash
# Verify it was installed
ls -l /usr/local/bin/fgwrite

# If missing, reinstall:
sudo bash scripts/install-linux.sh
```

### Error: "GROQ_API_KEY not found"

Add your API key through the GUI:
```bash
fgwrite --gui
```
Then go to Settings → API Configuration and paste your key.

Or edit .env manually:
```bash
nano .env
# Add: GROQ_API_KEY=your_key_here
```

### Error: "Python not found"

Install Python 3.8+:
```bash
# Ubuntu/Debian
sudo apt install python3 python3-pip python3-venv

# Fedora/RHEL
sudo dnf install python3 python3-pip

# Arch
sudo pacman -S python python-pip
```

### Error: "Module not found" (groq, click, etc.)

Reinstall the package:
```bash
cd <installation-directory>
source venv/bin/activate
pip install -r requirements.txt
pip install -e .
```

---

## Getting Your API Key

1. Go to https://console.groq.com/keys
2. Sign up (free account takes 2 minutes)
3. Click "Create API Key"
4. Copy the key
5. Add to your .env file
6. Save and restart

---

## Uninstall

Windows:
```
scripts/uninstall.bat
```

Linux:
```bash
rm -rf writeupforge/
```

---

## Requirements

[+] Python 3.8 or higher
[+] Internet connection
[+] 500MB disk space
[+] Free Groq API key

---

## License

MIT License

---

For issues or questions, visit: https://github.com/thehusnain/writeupforge
