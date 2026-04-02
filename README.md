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

## 🚀 Quick Start (All Platforms)

### Option 1: Universal Python Installer (Recommended)

Works on Windows, Linux, and macOS:

```bash
# Clone the repository
git clone https://github.com/your-username/WriteSec.git
cd WriteSec

# Run the universal installer
python install.py

# Follow the on-screen instructions
```

### Option 2: Platform-Specific Setup

#### Windows
```bash
# Download the repository first, then in Command Prompt or PowerShell:
setup_env.bat
```

#### Linux / macOS
```bash
# Make the script executable
chmod +x setup_env.sh

# Run the setup
./setup_env.sh
```

---

## ⚙️ Configuration (All Platforms)

### Step 1: Get Your Groq API Key

1. Visit [https://console.groq.com/keys](https://console.groq.com/keys)
2. Sign up for a free account (if needed)
3. Click **"Create API Key"**
4. Copy the generated key

### Step 2: Create .env File

After installation, create a `.env` file in the project directory:

**Windows (Notepad or Text Editor)**:
1. Right-click in the folder → New → Text File
2. Name it `.env` (make sure it starts with a dot)
3. Open and add:
```env
GROQ_API_KEY=your_copied_key_here
```

**Linux / macOS (Terminal)**:
```bash
echo "GROQ_API_KEY=your_copied_key_here" > .env
```

---

## 🏃 Running the Application

### Windows
```bash
# GUI (Graphical interface)
launch.bat

# Or from PowerShell/Command Prompt
python run.py
python run.py --gui
python run.py --cli
```

### Linux / macOS
```bash
# Activate virtual environment first
source venv/bin/activate

# GUI mode
python run.py --gui

# CLI mode (interactive command-line)
python run.py --cli

# Auto-detect (GUI on Windows, CLI on Linux/macOS)
python run.py
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

### Installation with pip (Global)

```bash
pip install git+https://github.com/your-username/WriteSec.git

# Then run from anywhere
writeupforge        # CLI mode
fgwrite            # Alias for CLI
```

### Development Setup

```bash
# Clone repository
git clone https://github.com/your-username/WriteSec.git
cd WriteSec

# Create virtual environment
python -m venv venv

# Activate (Windows)
venv\Scripts\activate

# Activate (Linux/macOS)
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run
python run.py
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
