@echo off
REM Lancement du bot Altissia sous Windows (double-clic)
chcp 65001 >nul
cd /d "%~dp0"
set PYTHONUTF8=1
if not exist ".venv\Scripts\python.exe" (
    echo Le bot n'est pas installe : lance d'abord install.bat
    pause
    exit /b 1
)
".venv\Scripts\python.exe" run.py %*
pause
