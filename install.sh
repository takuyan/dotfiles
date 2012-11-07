#!/usr/bin/env bash

echo "Delete the old files"
rm -f ~/.vimrc
rm -f ~/.zshrc
rm -f ~/.zshenv
rm -f ~/.gvimrc
rm -f ~/.gemrc
rm -f ~/.powconfig
rm -f ~/.bashrc
#rm ~/.gitconfig
#rm ~/.gitignore

echo "Symlinking files"
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/zshenv ~/.zshenv
ln -s ~/dotfiles/gvimrc ~/.gvimrc
ln -s ~/dotfiles/gemrc ~/.gemrc
ln -s ~/dotfiles/powconfig ~/.powconfig
ln -s ~/dotfiles/bashrc ~/.bashrc
#ln -s ~/dotfiles/gitconfig ~/.gitconfig
#ln -s ~/dotfiles/gitignore ~/.gitignore

#echo "Updating submodules"
#git submodule foreach git pull origin master --recurse-submodules

echo "All done."

