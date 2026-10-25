@echo off
REM Installation du bot Altissia sous Windows (double-clic)
chcp 65001 >nul
cd /d "%~dp0"
echo === Installation du Bot Altissia ===

set "PY="
where py >nul 2>nul && set "PY=py -3"
if not defined PY (
    where python >nul 2>nul && set "PY=python"
)
if not defined PY (
    echo [ERREUR] Python introuvable.
    echo Installe Python 3 depuis https://www.python.org/downloads/
    echo en cochant "Add python.exe to PATH", puis relance install.bat
    pause
    exit /b 1
)
%PY% --version || (
    echo [ERREUR] Python ne se lance pas. Installe-le depuis python.org, pas depuis le Microsoft Store.
    pause
    exit /b 1
)

if not exist ".venv\Scripts\python.exe" (
    echo Creation du venv...
    %PY% -m venv .venv || (echo [ERREUR] creation du venv impossible & pause & exit /b 1)
)

echo Installation des dependances...
".venv\Scripts\python.exe" -m pip install --upgrade pip
".venv\Scripts\python.exe" -m pip install -e . || (echo [ERREUR] pip install & pause & exit /b 1)

echo Installation de Chromium pour Playwright...
".venv\Scripts\python.exe" -m playwright install chromium || (echo [ERREUR] playwright install & pause & exit /b 1)

if not exist ".env" (
    copy ".env.example" ".env" >nul
    echo Fichier .env cree : remplis tes identifiants et l'URL de connexion de ton ecole.
    notepad ".env"
) else (
    echo Fichier .env existant, non modifie.
)

echo.
echo === Installation terminee ! Lance le bot avec run.bat ===
pause
