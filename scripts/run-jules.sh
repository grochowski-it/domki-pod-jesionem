#!/bin/bash

if [ ! -f skills.md ]; then
  curl -sL https://raw.githubusercontent.com/JuliusBrussee/caveman/main/README.md -o skills.md
fi

if [ -f .env ]; then
  set -a
  source .env
  set +a
fi

PROMPT="PAMIĘTAJ: Działasz w trybie Caveman. Musisz zacząć od 'Caveman mode: ON'. Używaj tylko skilli: caveman, caveman-commit, caveman-review. $1"

# Wywołujemy komendę przekazaną w argumentach skryptu
shift
OUTPUT=$("$@" "$PROMPT")
echo "$OUTPUT" | python3 scripts/validator.py
if [ $? -eq 0 ]; then
  echo "$OUTPUT"
else
  exit 1
fi
