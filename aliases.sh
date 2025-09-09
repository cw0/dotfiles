#!/bin/bash

echo "setting config aliases"

rm -rf ~/.asdfrc
ln -sr .asdfrc ~/.asdfrc

rm -f ~/.zshrc
ln -sr .zshrc ~/.zshrc

rm -f ~/.zshenv
ln -sr .zshenv ~/.zshenv

rm -f ~/.zshaliases
ln -sr .zshaliases ~/.zshaliases

rm -f ~/.vimrc
ln -sr .vimrc ~/.vimrc

rm -f ~/.config/eww
ln -sr .config/eww ~/.config/eww

rm -f ~/.config/kitty
ln -sr .config/kitty ~/.config/kitty

rm -f ~/.config/hypr
ln -sr .config/hypr ~/.config/hypr

rm -rf ~/.config/nvim
ln -sr .config/nvim ~/.config/nvim

rm -rf ~/.config/tmux
ln -sr .config/tmux ~/.config/tmux

rm -rf ~/.config/sc-im
ln -sr .config/sc-im ~/.config/sc-im

rm -rf ~/.config/neofetch
ln -sr .config/neofetch ~/.config/neofetch

rm -rf ~/.config/easyeffects
ln -sr .config/easyeffects ~/.config/easyeffects

rm -rf ~/.config/ranger
ln -sr .config/ranger ~/.config/ranger
