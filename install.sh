#!/usr/bin/env bash

oh_my_zsh_install_or_update()
{
  echo "[CHECK]   Oh-My-Zsh"
  if [ -d $HOME/.oh-my-zsh ]
  then
    echo "[UPDATE]  git pull Oh-My-Zsh"
    cd $HOME/.oh-my-zsh
    git pull origin master
    cd $HOME
  else
    echo "[INSTALL] git clone Oh-My-Zsh"
    git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
  fi
}

zsh_completions_install_or_update()
{
  echo "[CHECK]   zsh-completions"
  if [ -d $HOME/.zsh-completions ]
  then
    echo "[UPDATE]  git pull zsh-completions"
    cd $HOME/.zsh-completions
    git pull origin master
    cd $HOME
  else
    echo "[INSTALL] git clone zsh-completions"
    git clone git://github.com/zsh-users/zsh-completions.git $HOME/.zsh-completions

    # You may have to force rebuild `zcompdump`:
    rm -f $HOME/.zcompdump
    compinit
  fi
}

delete_old_files()
{
  echo "[DELETE] Delete the old files"
  rm -f ~/.vimrc
  rm -f ~/.zshrc
  rm -f ~/.zshenv
  rm -f ~/.gvimrc
  rm -f ~/.gemrc
  rm -f ~/.powconfig
  rm -f ~/.bashrc
  #rm ~/.gitconfig
  #rm ~/.gitignore
}

symlink_files()
{
  echo "[Symlink] Symlinking files"
  ln -s ~/dotfiles/vimrc ~/.vimrc
  ln -s ~/dotfiles/zshrc ~/.zshrc
  ln -s ~/dotfiles/zshenv ~/.zshenv
  ln -s ~/dotfiles/gvimrc ~/.gvimrc
  ln -s ~/dotfiles/gemrc ~/.gemrc
  ln -s ~/dotfiles/powconfig ~/.powconfig
  ln -s ~/dotfiles/bashrc ~/.bashrc
  #ln -s ~/dotfiles/gitconfig ~/.gitconfig
  #ln -s ~/dotfiles/gitignore ~/.gitignore
}

#
# Main Start
#
oh_my_zsh_install_or_update 1
zsh_completions_install_or_update 1
delete_old_files 1
symlink_files 1

echo "[DONE]  All done."




