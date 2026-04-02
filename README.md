# WriteupForge 📝

Convert raw cybersecurity lab notes into professional, structured Markdown and PDF reports using AI.

**Platform Support**: Windows | Linux | macOS  
**UI Options**: GUI (Graphical) | CLI (Command-line)

---

## ✨ Features

- **🤖 AI-Powered**: Uses Groq's fast and free API
- **🖥️ Multi-Platform**: Works on Windows, Linux, and macOS
- **🖱️ GUI & CLI Modes**: Choose your preferred interface
- **📄 Dual Output**: Generates both Markdown and PDF reports
- **⚡ Fast Setup**: Automated installation scripts
- **🔄 Auto-Updates**: Built-in update checker
- **🎨 Professional Styling**: Beautiful formatted output

---

## 📋 Prerequisites

- **Python 3.8 or higher** ([Download here](https://www.python.org/downloads/))
- **Groq API Key** (Free - [Get it here](https://console.groq.com/keys))
- **Git** (Optional, for cloning - [Download here](https://git-scm.com/))

---

## 🚀 Quick Start - Choose Your Method

### ⭐ Easiest for Windows - Setup Wizard

**One-click installation with automatic shortcuts!**

1. **Download the repository**
   - Get ZIP from GitHub and extract, OR
   - `git clone https://github.com/thehusnain/writeupforge.git`

2. **Run Setup Wizard**
   - Right-click `install-wizard.ps1`
   - Select **"Run with PowerShell"**
   - Click "Yes" when prompted (needs admin)
   - Follow wizard instructions

3. **Automatic Setup**
   - ✅ Creates virtual environment
   - ✅ Installs all dependencies
   - ✅ Creates **Desktop icon** 🖱️
   - ✅ Creates **Start Menu shortcut** 📋
   - ✅ Sets up `.env` file

4. **Add Your API Key**
   - Open `.env` file in WriteupForge folder
   - Add your Groq API key

5. **Launch!**
   - Click **Desktop icon** OR
   - Find in **Start Menu > WriteupForge**

---

### ⭐ Easiest for Linux / macOS - Global pip Installation

**Available everywhere with one command!**

#### Option A: pip (Recommended - Simplest)

```bash
# Install directly from GitHub
pip3 install git+https://github.com/thehusnain/writeupforge.git

# Add your API key
echo "GROQ_API_KEY=your_key_here" > ~/.writeupforge/.env

# Run from anywhere
writeupforge        # CLI mode
python3 run.py --gui  # GUI mode
```

#### Option B: pipx (Isolated Environment)

```bash
# Install pipx if needed
pip3 install --user pipx

# Install WriteupForge isolated
pipx install git+https://github.com/thehusnain/writeupforge.git

# Run from anywhere
writeupforge
```

#### Option C: Interactive Setup Wizard

```bash
# Clone and run installer
git clone https://github.com/thehusnain/writeupforge.git
cd writeupforge

chmod +x install-linux.sh
./install-linux.sh

# Choose: 1 (pip), 2 (pipx), or 3 (local venv)
```

---

## 📱 Desktop Launchers

### Windows After Setup Wizard 
- ✅ Desktop shortcut for instant launch
- ✅ Start Menu folder (WriteupForge)
- ✅ Uninstall option in Start Menu

### Linux After pip/pipx Installation
- ✅ Application launcher in your menu
- ✅ Search "WriteupForge" in applications
- ✅ Run command: `writeupforge` or `fgwrite`

---

## ⚙️ Configuration (All Platforms)

### Step 1: Get Your Free Groq API Key

1. Visit [https://console.groq.com/keys](https://console.groq.com/keys)
2. Sign up for free account (takes 2 minutes)
3. Click **"Create API Key"**
4. Copy the generated key

### Step 2: Add API Key to .env

**If you used Windows Setup Wizard:**
- The `.env` file was created automatically
- Just open it and add your key:
```env
GROQ_API_KEY=your_copied_key_here
```

**If you used pip/pipx:**
```bash
# Create config folder
mkdir -p ~/.writeupforge

# Add your key
echo "GROQ_API_KEY=your_copied_key_here" > ~/.writeupforge/.env
```

---

## 🏃 Running the Application

### Windows - After Setup Wizard
```bash
# Method 1: Click the Desktop icon
# Double-click "WriteupForge" on your Desktop

# Method 2: Use Start Menu
# Start Menu > WriteupForge > WriteupForge

# Method 3: Command line (from project folder)
python run.py
python run.py --gui
python run.py --cli
```

### Linux / macOS - After pip/pipx Installation
```bash
# Method 1: Command shortcuts (from anywhere)
writeupforge          # CLI mode
fgwrite              # Alias for CLI

# Method 2: GUI mode (from anywhere)
python3 run.py --gui

# Method 3: Use application launcher
# Search for "WriteupForge" in your applications menu

# Method 4: From project folder
python3 run.py
python3 run.py --cli
```

---

## 💻 Usage

### GUI Mode (Windows, Linux, macOS) - Recommended
1. Open WriteupForge
2. Fill in the writeup details:
   - **📝 Writeup Title**: Name of your challenge or exercise
   - **👤 Your Name**: Your full name
   - **🎯 Platform**: Select from HackTheBox, TryHackMe, PortSwigger, or enter custom
   - **⭐ Difficulty**: Beginner, Intermediate, Advanced, or Expert
3. **📋 Paste your lab notes** in the text area
4. Click **✨ Generate Professional Report**
5. Files save automatically to `output/` folder

**Tips for best results:**
- Include reconnaissance, enumeration, and exploitation steps
- Add which tools you used
- Include flags or proof of exploitation
- Share what you learned

### CLI Mode (Terminal/Command Prompt) - Fast and Focused
```bash
python run.py --cli
```

The CLI guide you through:
1. **📝 Writeup Title**: Enter the challenge name (minimum 3 characters)
2. **👤 Your Name**: Enter your full name
3. **🎯 Platform**: Choose from popular CTF platforms or enter custom
4. **⭐ Difficulty Level**: Select the challenge's difficulty
5. **📋 Lab Notes**: Paste or type your notes (type `DONE` on a new line to finish)

---

## 📂 Output Files

Generated files are saved in the `output/` directory:

```
output/
├── Challenge_Name_Writeup.md    # Markdown (edit-friendly)
└── Challenge_Name_Writeup.pdf   # Professional PDF
```

---

## 🔧 Advanced Usage

> **Note:** Most users should use the Windows Setup Wizard or Linux pip/pipx methods above. This section is for developers or advanced users.

### Development Setup

```bash
# Clone repository
git clone https://github.com/thehusnain/writeupforge.git
cd writeupforge

# Create virtual environment
python -m venv venv

# Activate (Windows)
venv\Scripts\activate

# Activate (Linux/macOS)
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Create .env file with your API key
echo "GROQ_API_KEY=your_key_here" > .env

# Run
python run.py        # Auto-detect (GUI on Windows, CLI on Linux)
python run.py --gui  # Force GUI mode
python run.py --cli  # Force CLI mode
```

### Manual pip Installation (Developers)

```bash
pip install git+https://github.com/thehusnain/writeupforge.git
```

---

## 🧹 Uninstallation

### Windows
```bash
uninstall.bat
```

### Linux / macOS
```bash
chmod +x uninstall_linux.sh
./uninstall_linux.sh
```

Or manually delete the `venv` folder:
```bash
rm -rf venv
```

---

## 🐛 Troubleshooting

### "Python not found"
- Install Python 3.8+ from [python.org](https://www.python.org/downloads/)
- Add Python to your PATH during installation

### "GROQ_API_KEY not found"
- Ensure `.env` file exists in the project directory
- Make sure the `.env` file contains: `GROQ_API_KEY=your_key`
- Save the file with UTF-8 encoding (no BOM)

### "Module not found"
```bash
# Reinstall dependencies
pip install -r requirements.txt

# Or with virtual environment
source venv/bin/activate  # Linux/macOS
# or
venv\Scripts\activate     # Windows

pip install -r requirements.txt
```

### "Permission denied" (Linux/macOS)
```bash
# Make scripts executable
chmod +x setup_env.sh
chmod +x uninstall_linux.sh
chmod +x launcher.py
```

---

## 📊 System Requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| Python | 3.8 | 3.11+ |
| RAM | 2GB | 4GB+ |
| Disk Space | 500MB | 1GB+ |
| Internet | Required | Required |

---

## 📝 License

MIT License - See LICENSE file for details

---

## 🤝 Contributing

Feel free to submit issues, fork the repository, and create pull requests for any improvements.

---

## ❓ FAQ

**Q: Is the API free?**  
A: Yes! Groq offers free API access with generous rate limits.

**Q: Can I use this offline?**  
A: No, you need an internet connection to use the Groq API.

**Q: What formats are supported?**  
A: Markdown (.md) and PDF (.pdf)

**Q: Can I modify the generated files?**  
A: Yes! Both MD and PDF files can be edited.

**Q: How do I get updates?**  
A: The app has a built-in update checker, or re-run `python install.py`

---

## 📧 Support

For issues, questions, or feature requests, please open an issue on GitHub.

---

**Made with ❤️ for cybersecurity enthusiasts**
