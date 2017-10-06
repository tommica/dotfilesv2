#!/bin/sh

basedir=$PWD

# Check for oh-my-zsh & zsh
CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
	printf "Zsh is not installed! Please install zsh first!\n"
	exit
fi

if [ ! -n "$ZSH" ]; then
	ZSH=~/.oh-my-zsh
fi

if [ -d "$ZSH" ]; then
	printf "Updating oh-my-zsh\n"
	cd $ZSH
	git pull
else
	printf "Install oh-my-zsh\n"
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi


cd $basedir
# Symlinks
echo "Deleting the old files"
rm ~/.vimrc
rm ~/.vim
rm ~/.gitconfig
rm ~/.gitignore
rm ~/.tmux.conf
rm ~/.zshrc

echo "Symlinking files"
ln -s "$PWD/vim" ~/.vim
ln -s "$PWD/vimrc" ~/.vimrc
ln -s "$PWD/gitconfig" ~/.gitconfig
ln -s "$PWD/gitignore" ~/.gitignore
ln -s "$PWD/tmux" ~/.tmux.conf
ln -s "$PWD/zshrc" ~/.zshrc

# Plugin update
echo "Update plugins"
vim -c PlugClean -c PlugInstall -c qa
