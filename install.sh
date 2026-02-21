#!/usr/bin/env bash

set -euo pipefail

RBENV_ROOT="$HOME/.rbenv"
RBENV_BIN="$RBENV_ROOT/bin/rbenv"

link_file()
{
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sfn "$src" "$dst"
}

rbenv_install_or_update()
{
  echo "[CHECK]   rbenv"
  if [ -d "$RBENV_ROOT" ]
  then
    echo "[UPDATE]  git pull rbenv"
    cd "$RBENV_ROOT"
    git pull origin master
    ruby_build_install_or_update 1
  else
    echo "[INSTALL] git clone rbenv"
    git clone https://github.com/rbenv/rbenv.git "$RBENV_ROOT"
    ruby_build_install_or_update 1
  fi

  if [ -x "$RBENV_BIN" ] ; then
    "$RBENV_BIN" rehash
  fi
}

ruby_build_install_or_update()
{
  mkdir -p "$RBENV_ROOT/plugins"
  cd "$RBENV_ROOT/plugins"

  echo "[CHECK]   ruby-build"
  if [ -d "$RBENV_ROOT/plugins/ruby-build" ]
  then
    echo "[UPDATE]  git pull ruby-build"
    cd "$RBENV_ROOT/plugins/ruby-build"
    git pull origin master
  else
    echo "[INSTALL] git clone ruby-build"
    cd "$RBENV_ROOT/plugins"
    git clone https://github.com/rbenv/ruby-build.git "$RBENV_ROOT/plugins/ruby-build"
  fi
}

delete_old_files()
{
  echo "[DELETE] Delete the old files"
  rm -f "$HOME/.bashrc"
  rm -f "$HOME/.bundle/config"
  rm -f "$HOME/.gemrc"
  rm -f "$HOME/.gitignore"
  rm -f "$HOME/.gvimrc"
  rm -f "$HOME/.powconfig"
  rm -f "$HOME/.railsrc"
  rm -f "$HOME/.vimrc"
  rm -f "$HOME/.zshenv"
  rm -f "$HOME/.zshrc"
  rm -rf "$HOME/.config/nvim"
  rm -f "$HOME/.config/starship.toml"
  rm -f "$HOME/.config/wezterm/wezterm.lua"
}

symlink_files()
{
  echo "[Symlink] Symlinking files"
  link_file "$HOME/dotfiles/bashrc" "$HOME/.bashrc"
  link_file "$HOME/dotfiles/bundle_config" "$HOME/.bundle/config"
  link_file "$HOME/dotfiles/gemrc" "$HOME/.gemrc"
  link_file "$HOME/dotfiles/gitignore" "$HOME/.gitignore"
  link_file "$HOME/dotfiles/gvimrc" "$HOME/.gvimrc"
  link_file "$HOME/dotfiles/powconfig" "$HOME/.powconfig"
  link_file "$HOME/dotfiles/.railsrc" "$HOME/.railsrc"
  link_file "$HOME/dotfiles/vimrc" "$HOME/.vimrc"

  link_file "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
  link_file "$HOME/dotfiles/starship.toml" "$HOME/.config/starship.toml"

  link_file "$HOME/dotfiles/zshenv" "$HOME/.zshenv"
  link_file "$HOME/dotfiles/zshrc" "$HOME/.zshrc"

  link_file "$HOME/dotfiles/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"
}

#
# Main Start
#
rbenv_install_or_update 1
delete_old_files 1
symlink_files 1

echo "[DONE]  All done."

cd "$HOME"
