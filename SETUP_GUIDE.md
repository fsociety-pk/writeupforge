# WriteupForge Setup & Usage Guide

## What I Fixed For You

### 1. **Missing `groq` Module** ✅
- **Problem**: You were getting `Error: No module named 'groq'` when running `python3 run.py --cli`
- **Solution**: Installed groq and all dependencies in your virtual environment
- **Details**: The groq module is now in `requirements.txt` and is automatically installed

### 2. **API Key Pasting Issue in GUI** ✅
- **Problem**: Paste wasn't working properly in the API key field
- **Solution**: Added:
  - Better paste event handling with keyboard shortcuts (Ctrl+V / Cmd+V)
  - Show/Hide button to verify your API key
  - Improved instructions for better UX
- **Location**: Settings → API Configuration tab

### 3. **`fgwrite` Command Setup** ✅
- **Problem**: The tool wasn't installable as a global command
- **Solution**: 
  - Updated setup.py and pyproject.toml with proper entry points
  - Created cli.py as the entry point module
  - Made the package installable with `pip install -e .`
- **Now works**: You can use `fgwrite` command after activating the virtual environment

---

## How to Use WriteupForge

### **First Time Setup** (One-Time)
```bash
cd ~/Desktop/WriteSec

# Run the install script
bash scripts/install-linux.sh

# Follow the prompts to:
# 1. Create virtual environment
# 2. Install dependencies
# 3. Enter your Groq API key (get it at https://console.groq.com/keys)
```

### **Running the Application**

**Always activate the virtual environment first:**
```bash
source ~/Desktop/WriteSec/venv/bin/activate
```

**Then use any of these commands:**
```bash
# Auto-detect mode (GUI on Windows, CLI on Linux)
fgwrite

# Command-line mode
fgwrite --cli

# Graphical mode
fgwrite --gui

# Or use python directly
python3 run.py --cli
python3 run.py --gui
```

### **Important Notes**

⚠️ **Virtual Environment is Required**
- You MUST activate the virtual environment before running `fgwrite`
- Command: `source ~/Desktop/WriteSec/venv/bin/activate`
- You'll see `(venv)` in your terminal prompt when it's active

✅ **Once Activated**
- You can then run `fgwrite` from ANY directory
- The activation only applies to the current terminal session
- Open a new terminal? Activate again!

---

## Troubleshooting

### Problem: "Command 'fgwrite' not found"
**Solution**: Activate the virtual environment first
```bash
source ~/Desktop/WriteSec/venv/bin/activate
fgwrite --cli
```

### Problem: Still getting "No module named 'groq'"
**Solution**: Reinstall dependencies
```bash
source ~/Desktop/WriteSec/venv/bin/activate
pip install -r requirements.txt
pip install -e .
```

### Problem: API key paste still not working in GUI
**Try this:**
1. Open Settings in the GUI
2. Click the clipboard icon or right-click in the API key field
3. Use the "Show Key" button to verify it was pasted correctly
4. Click "Test Connection" to validate

### Problem: "Permission denied" when running install-linux.sh
**Solution**: Make it executable
```bash
chmod +x ~/Desktop/WriteSec/scripts/install-linux.sh
bash scripts/install-linux.sh
```

---

## File Changes Made

| File | Change |
|------|---------|
| `scripts/install-linux.sh` | Updated to install as editable package for global `fgwrite` command |
| `main_gui.py` | Enhanced API key input with better paste handling and show/hide toggle |
| `cli.py` | New file - creates proper entry point for fgwrite command |
| `setup.py` | Updated entry points and added py_modules |
| `pyproject.toml` | Updated entry points for fgwrite command |
| `requirements.txt` | Already had groq (ensured it's installed) |

---

## Tips & Tricks

📌 **Create an Alias** (Optional)
Add this to your `~/.bashrc` or `~/.zshrc` to avoid typing the activate command:
```bash
alias fgwrite='source ~/Desktop/WriteSec/venv/bin/activate && fgwrite'
```
Then reload: `source ~/.bashrc`

📌 **Batch Process Reports**
You can create multiple writeups in the GUI and they'll all save to the `output/` folder

📌 **Customize Output Directory**
Check the output folder location in the settings

---

**Questions?** Review the README.md or check the QUICKSTART.md for more details!
