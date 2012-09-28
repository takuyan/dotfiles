#!/usr/bin/env bash

echo "Delete the old files"
rm ~/.vimrc
rm ~/.zshrc
rm ~/.gvimrc
rm ~/.gemrc
#rm ~/.gitconfig
#rm ~/.gitignore

echo "Symlinking files"
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/gvimrc ~/.gvimrc
ln -s ~/dotfiles/gemrc ~/.gemrc
#ln -s ~/dotfiles/gitconfig ~/.gitconfig
#ln -s ~/dotfiles/gitignore ~/.gitignore

#echo "Updating submodules"
#git submodule foreach git pull origin master --recurse-submodules

echo "All done."

