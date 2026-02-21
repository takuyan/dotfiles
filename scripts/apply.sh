#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

link_file() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sfn "$src" "$dst"
}

echo "[RUN] removing old links/files"
rm -f "$HOME/.bashrc"
rm -f "$HOME/.bundle/config"
rm -f "$HOME/.gemrc"
rm -f "$HOME/.gitignore"
rm -f "$HOME/.vimrc"
rm -f "$HOME/.zshenv"
rm -f "$HOME/.zshrc"
rm -rf "$HOME/.config/nvim"
rm -f "$HOME/.config/starship.toml"
rm -f "$HOME/.config/wezterm/wezterm.lua"

echo "[RUN] creating symlinks"
link_file "$ROOT_DIR/bashrc" "$HOME/.bashrc"
link_file "$ROOT_DIR/bundle_config" "$HOME/.bundle/config"
link_file "$ROOT_DIR/gemrc" "$HOME/.gemrc"
link_file "$ROOT_DIR/gitignore" "$HOME/.gitignore"
link_file "$ROOT_DIR/vimrc" "$HOME/.vimrc"

link_file "$ROOT_DIR/nvim" "$HOME/.config/nvim"
link_file "$ROOT_DIR/starship.toml" "$HOME/.config/starship.toml"
link_file "$ROOT_DIR/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"

link_file "$ROOT_DIR/zshenv" "$HOME/.zshenv"
link_file "$ROOT_DIR/zshrc" "$HOME/.zshrc"

echo "[OK] apply completed."
