"""
Constantes, sélecteurs et listes de mots pour le bot Altissia.
"""

# Libellés FR + EN (l'interface Altissia peut être en anglais)
VALIDATE_LABELS = ["Valider", "Vérifier", "Check", "Validate", "Submit", "Verify"]
CONTINUE_LABELS = ["Continuer", "Suivant", "Continue", "Next"]
RETRY_LABELS = ["Réessayer", "Ressayer", "Recommencer", "Try again", "Retry", "Restart"]
START_LABELS = ["Commencer", "Start", "Begin"]


def _buttons(labels):
    return ", ".join(f'button:has-text("{label}")' for label in labels)


SELECTORS = {
    "input_field": 'input.c-iJOJc, input[type="text"]',
    "validate_button": _buttons(VALIDATE_LABELS),
    "correct_answer": "span.c-gUxMKR-bkfbUO-isCorrect-true",
    "continue_button": "button.c-jUtMbh, " + _buttons(CONTINUE_LABELS),
    "retry_button": _buttons(RETRY_LABELS),
    "start_button": _buttons(START_LABELS),
}

BLACKLIST_WORDS = [
    "Incorrect",
    "Correct",
    "Wrong",
    "Faux",
    "Vrai",
    "Error",
    "Success",
    "Valider",
    "Continuer",
    "Check",
    "Submit",
    "Continue",
    "Hint",
    "Try again",
    "Retry",
    "Revenir",
    "Ressayer",
    "Réessayer",
    "Pause",
    "Play",
    "Mute",
    "Skip",
    "Select the right answer",
    "Choose",
    "Click",
    "Put the elements in the right order",
    "Sélectionnez le premier élément",
    "Listen to",
    "Max is writing",
    "Accueil",
    "Toutes les leçons",
    "Actualités",
]

# Liste des variantes de vert utilisées par Altissia (pour référence)
GREEN_COLORS = [
    "rgb(26, 179, 92)",
    "rgb(233, 251, 241)",
    "rgb(34, 197, 94)",
    "rgb(22, 163, 74)",
    "rgb(16, 185, 129)",
    "rgb(5, 150, 105)",
    "rgb(0, 128, 0)",
    "rgb(0, 255, 0)",
    "rgb(76, 175, 80)",
    "rgb(46, 125, 50)",
    "rgb(67, 160, 71)",
    "rgb(102, 187, 106)",
    "rgb(139, 195, 74)",
    "rgb(156, 204, 101)",
    "rgb(200, 230, 201)",
    "rgb(165, 214, 167)",
]
