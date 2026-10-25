#!/bin/bash
# Installation du bot Altissia (Linux / WSL / macOS)
# Usage : ./scripts/install.sh   (depuis la racine du projet)

set -e
cd "$(dirname "$0")/.."

echo "🤖 Installation du Bot Altissia"
echo "================================"

if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 n'est pas installé (sur Ubuntu/WSL : sudo apt install python3 python3-venv)"
    exit 1
fi
echo "✅ $(python3 --version)"

# Environnement virtuel
if [ ! -d .venv ]; then
    echo "📦 Création du venv (.venv)..."
    python3 -m venv .venv || {
        echo "❌ Impossible de créer le venv (sur Ubuntu/WSL : sudo apt install python3-venv)"
        exit 1
    }
fi
# shellcheck disable=SC1091
source .venv/bin/activate
echo "✅ venv activé"

# Dépendances (mode éditable : les modifs du code sont prises en compte sans réinstaller)
echo "📦 Installation des dépendances Python..."
pip install --upgrade pip > /dev/null
pip install -e .
echo "✅ Dépendances installées"

# Navigateur Chromium pour Playwright
echo "🌐 Installation de Chromium pour Playwright..."
playwright install chromium
if [ "$(uname)" = "Linux" ]; then
    echo "🌐 Installation des bibliothèques système de Chromium (sudo peut être demandé)..."
    playwright install-deps chromium || echo "⚠️  install-deps a échoué : lancez 'sudo .venv/bin/playwright install-deps chromium'"
fi
echo "✅ Chromium installé"

# Fichier de configuration
if [ ! -f .env ]; then
    cp .env.example .env
    echo "📝 Fichier .env créé : éditez-le avec vos identifiants et l'URL de connexion de votre école"
else
    echo "ℹ️  Fichier .env existant (non modifié)"
fi

echo ""
echo "🎉 Installation terminée !"
echo "Pour lancer le bot :"
echo "  source .venv/bin/activate"
echo "  python run.py"
