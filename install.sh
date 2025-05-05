#!/usr/bin/env bash

rbenv_install_or_update()
{
  echo "[CHECK]   rbenv"
  if [ -d $HOME/.rbenv ]
  then
    echo "[UPDATE]  git pull rbenv"
    cd $HOME/.rbenv
    git pull origin master
    ruby_build_install_or_update 1
  else
    echo "[INSTALL] git clone rbenv"
    git clone git@github.com:rbenv/rbenv.git $HOME/.rbenv
    exec $SHELL
    ruby_build_install_or_update 1
  fi
  rbenv rehash
}

ruby_build_install_or_update()
{
  mkdir -p $HOME/.rbenv/plugins
  cd $HOME/.rbenv/plugins

  echo "[CHECK]   ruby-build"
  if [ -d $HOME/.rbenv/plugins/ruby-build ]
  then
    echo "[UPDATE]  git pull ruby-build"
    cd $HOME/.rbenv/plugins/ruby-build
    git pull origin master
  else
    echo "[INSTALL] git clone ruby-build"
    cd $HOME/.rbenv/plugins
    git clone git@github.com:rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
  fi
}

oh_my_zsh_install_or_update()
{
  echo "[CHECK]   Oh-My-Zsh"
  if [ -d $HOME/.oh-my-zsh ]
  then
    echo "[UPDATE]  git pull Oh-My-Zsh"
    cd $HOME/.oh-my-zsh
    git pull origin master
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
  rm -f $HOME/.bashrc
  rm -f $HOME/.bundle/config
  rm -f $HOME/.gemrc
  rm -f $HOME/.gitignore
  rm -f $HOME/.gvimrc
  rm -f $HOME/.powconfig
  rm -f $HOME/.railsrc
  rm -f $HOME/.vimrc
  rm -f $HOME/.zshenv
  rm -f $HOME/.zshrc
  #rm ~/.gitconfig
}

symlink_files()
{
  echo "[Symlink] Symlinking files"
  ln -s $HOME/dotfiles/bashrc        $HOME/.bashrc
  ln -s $HOME/dotfiles/bundle_config $HOME/.bundle/config
  ln -s $HOME/dotfiles/gemrc         $HOME/.gemrc
  ln -s $HOME/dotfiles/gitignore     $HOME/.gitignore
  ln -s $HOME/dotfiles/gvimrc        $HOME/.gvimrc
  ln -s $HOME/dotfiles/powconfig     $HOME/.powconfig
  ln -s $HOME/dotfiles/railsrc       $HOME/.railsrc
  ln -s $HOME/dotfiles/vimrc         $HOME/.vimrc

  mkdir -p $HOME/.config/nvim
  ln -s $HOME/dotfiles/nvim_init.vim $HOME/.config/nvim/init.vim

  ln -s $HOME/dotfiles/zshenv        $HOME/.zshenv
  ln -s $HOME/dotfiles/zshrc         $HOME/.zshrc
  #ln -s $HOME/dotfiles/gitconfig ~/.gitconfig

  mkdir -p $HOME/.config/wezterm
  ln -s $HOME/dotfiles/wezterm.lua $HOME/.config/wezterm/wezterm.lua
}

#
# Main Start
#
rbenv_install_or_update 1
oh_my_zsh_install_or_update 1
zsh_completions_install_or_update 1
delete_old_files 1
symlink_files 1

echo "[DONE]  All done."

cd $HOME
