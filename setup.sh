#!/bin/bash

# check user permissions first
echo "checking permissions..."

is_sudoer() {
    ## Define error code
    E_NOTROOT=87 # Non-root exit error.

    ## check if is sudoer
    if ! $(sudo -l &> /dev/null); then
        echo 'Error: root privileges are needed to run this script'
        return $E_NOTROOT
    fi
    return  0
}

if is_sudoer; then
    echo "sudo permissions detected, continuing..."
else
    echo "retry with sudo permissions."
    exit 87
fi

# update existing packages
echo "updating packages..."

sudo pacman -Syu --noconfirm

# install yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm

cd ..
rm -rf yay

# installing development env manager
echo "Y" | LANG=C yay --provides=false --answerdiff None --answerclean None --mflags "--noconfirm" -S asdf-vm

. /opt/asdf-vm/asdf.sh
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

# install programs
echo "installing programs..."

LANG=C yay --provides=false --answerdiff None --answerclean None --mflags "--noconfirm" -S $(cat package-list.txt)

# move configuration files
./aliases.sh

# set shell to zsh
echo "changing shell to zsh..."
chsh -s $(which zsh)

echo "you must restart for this change to take effect"
