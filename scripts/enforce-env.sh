#!/bin/bash
if [ ! -f .env ]; then
  echo "STOP: Brak .env"
  exit 1
fi
