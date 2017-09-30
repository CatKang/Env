#!/bin/sh
cd ~
rm .tmux.conf
ln -s ~/Env/tmux/tmux.conf .tmux.conf
rm .vimrc
ln -s ~/Env/vim/vimrc .vimrc
rm -rf .vim
ln -s ~/Env/vim .vim

# Install Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
