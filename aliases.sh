# TODO add bash header
# TODO update setup to call this script
echo "Updating configs"
rm -f ~/.p10k.zsh
ln -sr .p10k.zsh ~/.p10k.zsh

rm -f ~/.zshrc
ln -sr .zshrc ~/.zshrc

rm -f ~/.zshenv
ln -sr .zshenv ~/.zshenv

rm -f ~/.zshaliases
ln -sr .zshaliases ~/.zshaliases

rm -f ~/.vimrc
ln -sr .vimrc ~/.vimrc

ln -sr vimwiki ~/vimwiki

rm -f ~/.config/kitty/kitty.conf
mkdir -p ~/.config/kitty
ln -sr .config/kitty/kitty.conf ~/.config/kitty/kitty.conf

rm -f ~/.tmux.conf
ln -sr .tmux.conf ~/.tmux.conf

rm -rf ~/.config/nvim
ln -sr .config/nvim ~/.config/nvim

mkdir -p ~/notes/home
ln -sr notes/home ~/notes/home
