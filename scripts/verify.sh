#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
errors=0

check_cmd() {
  local cmd="$1"
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "[OK] command found: $cmd"
  else
    echo "[NG] command missing: $cmd"
    errors=$((errors + 1))
  fi
}

check_link() {
  local dst="$1"
  local expected="$2"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$expected" ]; then
    echo "[OK] link: $dst -> $expected"
  else
    echo "[NG] link mismatch: $dst"
    errors=$((errors + 1))
  fi
}

echo "[RUN] command checks"
check_cmd brew
check_cmd git
check_cmd zsh
check_cmd nvim
check_cmd starship
check_cmd direnv

echo "[RUN] symlink checks"
check_link "$HOME/.zshrc" "$ROOT_DIR/zshrc"
check_link "$HOME/.config/nvim" "$ROOT_DIR/nvim"
check_link "$HOME/.config/starship.toml" "$ROOT_DIR/starship.toml"
check_link "$HOME/.config/wezterm/wezterm.lua" "$ROOT_DIR/wezterm.lua"

if [ "$errors" -gt 0 ]; then
  echo "[FAIL] verify failed with $errors issue(s)."
  exit 1
fi

echo "[OK] verify completed."
