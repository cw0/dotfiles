#!/bin/bash

echo "Updating configs"
rm -f ~/.p10k.zsh
ln -sr .p10k.zsh ~/.p10k.zsh

rm -rf ~/.oh-my-zsh
ln -sr .oh-my-zsh ~/.oh-my-zsh

rm -f ~/.zshrc
ln -sr .zshrc ~/.zshrc

rm -f ~/.zshenv
ln -sr .zshenv ~/.zshenv

rm -f ~/.zshaliases
ln -sr .zshaliases ~/.zshaliases

rm -f ~/.vimrc
ln -sr .vimrc ~/.vimrc

rm -f ~/.config/kitty/kitty.conf
mkdir -p ~/.config/kitty
ln -sr .config/kitty/kitty.conf ~/.config/kitty/kitty.conf

rm -f ~/.tmux.conf
ln -sr .tmux.conf ~/.tmux.conf

rm -rf ~/.config/nvim
ln -sr .config/nvim ~/.config/nvim
