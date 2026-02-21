#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BREWFILE="$ROOT_DIR/Brewfile"

if ! command -v brew >/dev/null 2>&1; then
  echo "[ERROR] Homebrew is not installed."
  echo "Install Homebrew first: https://brew.sh/"
  exit 1
fi

if [ ! -f "$BREWFILE" ]; then
  echo "[ERROR] Brewfile not found: $BREWFILE"
  exit 1
fi

echo "[RUN] brew bundle --file $BREWFILE"
brew bundle --file "$BREWFILE"

echo "[OK] bootstrap completed."
