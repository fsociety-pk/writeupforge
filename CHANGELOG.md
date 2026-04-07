# Changelog

All notable changes to WriteupForge will be documented in this file.

## [1.1.0] - April 7, 2026

### ✨ New Features

#### Automatic Writeup Type Detection
- AI now automatically detects the type of writeup from raw notes
- Supports 6 different writeup types:
  - **CTF** - Competitive programming and CTF challenges
  - **Lab** - Machine/Lab writeups (HTB, TryHackMe, VulnHub)
  - **Learning Notes** - Educational content and tutorials
  - **Research** - Technical research and vulnerability analysis
  - **Exploitation** - Exploitation techniques and PoCs
  - **Tool Usage** - Tools guides and usage documentation

#### Adaptive Content Structure
- Content structure adapts based on detected writeup type
- Each type has specifically tailored sections for better organization
- Automatic table generation where appropriate
- Professional formatting with proper code block handling

#### GitHub-Ready Output
- Automatic generation of professional `README.md` files
- README includes:
  - Project overview with metadata
  - Table of contents for easy navigation
  - Prerequisites section tailored to writeup type
  - Getting started guide
  - Key learnings and resources
  - Proper licensing section
- Organized folder structure ready for direct GitHub push

#### Improved Project Organization
- Creates dedicated folders for each writeup project
- Clean file structure:
  ```
  output/
  └── Project_Name/
      ├── README.md      # GitHub-ready documentation
      ├── writeup.md     # Structured writeup
      └── writeup.pdf    # PDF version
  ```

#### Enhanced UI/UX
- Better console output showing detected writeup type
- Clear project structure visualization
- Improved success messages with folder organization information

### 🔧 Technical Improvements

- Increased token limit for better content generation (3000 tokens)
- Improved system prompt for universal writeup handling
- Better markdown formatting guidelines
- Added table support in generated content
- Enhanced code block language specification

### 📚 New Modules

- **writeup_types.py** - Writeup type detection and structured templates
  - `WriteupTypeDetector` - Detects writeup type from content
  - `StructuredPromptBuilder` - Builds type-specific prompts
  - `GitHubReadmeGenerator` - Creates GitHub-ready README files

### 🔄 Updates

- **ai_handler.py**
  - New `detect_writeup_type()` method
  - Enhanced `generate_writeup()` now returns type information
  - New `generate_github_readme()` method

- **main.py**
  - Improved folder structure creation
  - README generation on every writeup
  - Better output formatting and user feedback

- **pyproject.toml**
  - Updated version to 1.1.0
  - Updated description to reflect new features

### 🎯 Benefits

✅ AI adapts to ANY type of writeup, not just labs  
✅ Structured output tailored to content type  
✅ One-command GitHub-ready projects  
✅ Professional README files auto-generated  
✅ No manual organization needed  
✅ Better content structure with tables and formatting  

## [1.0.0] - Initial Release

### Initial Features
- Basic writeup generation from raw notes
- Markdown and PDF output
- CLI interface
- Groq AI integration
- Support for lab-based writeups

---

## Notes

For migration from v1.0.0 to v1.1.0:
- Existing workflow remains the same
- Output folder structure will change (now includes project folders)
- README files will be auto-generated alongside writeups
- No breaking changes to CLI commands
