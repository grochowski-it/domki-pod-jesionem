#!/bin/bash

if [ ! -f skills.md ]; then
  curl -sL https://raw.githubusercontent.com/JuliusBrussee/caveman/main/README.md -o skills.md
fi

if [ -f .env ]; then
  set -a
  source .env
  set +a
fi

HARD_PROMPT="PAMIĘTAJ: Działasz w trybie Caveman. Musisz zacząć od 'Caveman mode: ON'. Używaj tylko skilli: caveman, caveman-commit, caveman-review. Pamiętaj o załadowaniu zmiennych z .env."
USER_PROMPT="$1"

shift
"$@" "$HARD_PROMPT $USER_PROMPT" | python3 scripts/validator.py
if [ ${PIPESTATUS[1]} -ne 0 ]; then
  exit 1
fi
