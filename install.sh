#!/usr/bin/env bash

echo "Delete the old files"
rm ~/.vimrc
rm ~/.zshrc
rm ~/.gvimrc
#rm ~/.gitconfig
#rm ~/.gitignore

echo "Symlinking files"
ln -s ~/config/vimrc ~/.vimrc
ln -s ~/config/zshrc ~/.zshrc
ln -s ~/config/gvimrc ~/.gvimrc
#ln -s ~/config/gitconfig ~/.gitconfig
#ln -s ~/config/gitignore ~/.gitignore

#echo "Updating submodules"
#git submodule foreach git pull origin master --recurse-submodules

echo "All done."

