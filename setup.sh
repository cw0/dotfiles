#!/bin/bash

echo "Updating Packages"
apt update && apt upgrade -y

echo "Installing Utils from APT"
apt install -y git tmux build-essential gcc procps curl file universal-ctags ruby-full kitty zsh

source ~/.bashrc

echo "Installing Homebrew"
export CI=1
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

echo "Updating Homebrew"
brew update

echo "Installing oh-my-zsh"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installing powerlevel10k"
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Installing ls colors"
gem install --user-install colorls

echo "Installing nerd font"
mkdir -p ~/.local/share/fonts/truetype
install -m644 'Roboto Mono Nerd Font Complete Mono.ttf' ~/.local/share/fonts/truetype/
fc-cache -fv

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# TODO install a version of node
nvm install --lts

echo "Installing vim"
brew install vim

echo "Updating configs"
rm -f ~/.p10k.zsh
ln -sr .p10k.zsh ~/.p10k.zsh

rm -f ~/.zshrc
ln -sr .zshrc ~/.zshrc

rm -f ~/.vimrc
ln -sr .vimrc ~/.vimrc

rm -f ~/.config/kitty/kitty.conf
mkdir ~/.config/kitty
ln -sr kitty.conf ~/.config/kitty/kitty.conf

echo "Changing default shell to ZSH"
# command -v zsh | sudo tee -a /etc/shells
chsh -s "$(command -v zsh)" $USER