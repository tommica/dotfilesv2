#!/usr/bin/env bash

echo "initializing submodules"
git submodule init
git submodule update

echo "Deleting the old files"
rm ~/.vimrc
rm ~/.vim
rm ~/.gvimrc
rm ~/.gitconfig
rm ~/.gitignore
rm ~/.tmux.conf
rm ~/.zshrc

echo "Symlinking files"
ln -s ~/Github/dotfilesv2/vimrc ~/.vimrc
ln -s ~/Github/dotfilesv2/vim ~/.vim
ln -s ~/Github/dotfilesv2/gitconfig ~/.gitconfig
ln -s ~/Github/dotfilesv2/gitignore ~/.gitignore
ln -s ~/Github/dotfilesv2/tmux ~/.tmux.conf
ln -s ~/Github/dotfilesv2/zshrc ~/.zshrc

echo "Updating submodules"
git submodule foreach git pull origin master #--recurse-submodules

echo "All done."

