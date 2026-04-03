@echo off
REM WriteupForge Uninstaller for Windows
REM Safely removes virtual environment, cache, and shortcuts

title WriteupForge Uninstallation
echo ================================================
echo  WriteupForge - Uninstallation
echo ================================================
echo.

REM 1. Remove virtual environment
if exist "venv" (
    echo [1/4] Removing virtual environment...
    rmdir /s /q venv
    echo [+] Virtual environment removed
) else (
    echo [1/4] Virtual environment not found
)

REM 2. Remove cache directories
echo [2/4] Removing cache files...
for /d /r . %%d in (__pycache__) do (
    if exist "%%d" rmdir /s /q "%%d"
)
echo [+] Cache files cleaned

REM 3. Remove compiled files
echo [3/4] Removing Python compiled files...
for /r . %%f in (*.pyc) do (
    if exist "%%f" del "%%f"
)
echo [+] Compiled files removed

REM 4. Remove Shortcuts
echo [4/4] Removing Desktop and Start Menu shortcuts...
set "desktopPath=%USERPROFILE%\Desktop\WriteupForge.lnk"
set "startMenuPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\WriteupForge"

if exist "%desktopPath%" (
    del "%desktopPath%"
    echo [+] Desktop shortcut removed
)

if exist "%startMenuPath%" (
    rmdir /s /q "%startMenuPath%"
    echo [+] Start Menu folder removed
)

echo.
echo ================================================
echo  Uninstallation complete!
echo ================================================
echo.
echo Note: The project folder (including your generated reports)
echo       has been kept safe. You can delete it manually if you 
echo       want a complete removal.
echo.
pause
