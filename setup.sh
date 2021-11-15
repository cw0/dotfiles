#!/bin/bash

echo "Updating Packages"
apt update && apt upgrade -y

echo "Installing Utils from APT"
apt install -y git tmux build-essential gcc procps curl file ruby-full

source ~/.bashrc

echo "Installing Homebrew"
export CI=1
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

echo "Updating Homebrew"
brew update

echo "Installing zsh"
brew install zsh

echo "Installing oh-my-zsh"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installing powerlevel10k"
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Installing ls colors"
# gem install colorls

echo "Installing nerd font"
mkdir -p ~/.local/share/fonts/truetype
install -m644 'Roboto Mono Nerd Font Complete Mono.ttf' ~/.local/share/fonts/truetype/
fc-cache -fv

echo "Installing nvm"
brew install nvm
# mkdir ~/.nvm
# echo "export NVM_DIR=$([ -z \"${XDG_CONFIG_HOME-}\" ] && printf %s \"${HOME}/.nvm\" || printf %s \"${XDG_CONFIG_HOME}/nvm\")" >> ~/.bashrc
# echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\" # This loads nvm" >> ~/.bashrc


# TODO install a version of node

echo "Installing vim"
brew install vim

echo "Installing kitty"
brew install kitty
# curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n

# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
# your PATH)
# mkdir ~/.local/bin
# ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
# cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# Update the path to the kitty icon in the kitty.desktop file
# sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop

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
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" $USER