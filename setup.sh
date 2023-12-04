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

# install programs
echo "installing programs..."

yes | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" -S $(cat package-list.txt)
