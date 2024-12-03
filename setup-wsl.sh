#update packages
sudo apt udate
sudo apt upgrade

#install most packages
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
  xz-utils tk-dev libffi-dev liblzma-dev git unzip exa zsh neofetch libcurl4-openssl-dev \
  luarocks fd-find ripgrep

# install github cli
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
  sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg &&
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
  sudo apt update &&
  sudo apt install gh -y

# install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# install neovim
$ sudo add-apt-repository ppa:neovim-ppa/unstable
$ sudo apt update
$ sudo apt install neovim

# install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
. ~/.asdf/asdf.sh
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git
asdf plugin-add python
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin-add terraform-ls https://github.com/asdf-community/asdf-hashicorp.git
asdf install nodejs latest
asdf install poetry latest
asdf install python latest
asdf install golang latest
asdf install terraform latest
asdf install terraform-ls latest
asdf global nodejs latest
asdf global poetry latest
asdf global python latest
asdf global golang latest
asdf global terraform latest
asdf global terraform-ls latest

# create ~/.config
mkdir ~/.config
source aliases.sh

# install oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh .oh-my-zsh

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install tpm for tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# install catpuccin for tmux
git clone https://github.com/catppuccin/tmux tmux

# install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
