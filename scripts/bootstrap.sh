#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BREWFILE="$ROOT_DIR/Brewfile"
OPTIONAL_BREWFILE="$ROOT_DIR/Brewfile.optional"

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

if [ "${DOTFILES_INCLUDE_OPTIONAL:-0}" = "1" ] && [ -f "$OPTIONAL_BREWFILE" ]; then
  echo "[RUN] brew bundle --file $OPTIONAL_BREWFILE"
  brew bundle --file "$OPTIONAL_BREWFILE"
else
  echo "[INFO] Optional packages skipped."
  echo "       Set DOTFILES_INCLUDE_OPTIONAL=1 to install Brewfile.optional."
fi

echo "[OK] bootstrap completed."
