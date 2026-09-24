#!/bin/bash
set -euo pipefail

echo "setting config aliases"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$HOME/.config"

link_path() {
  local src="$1"
  local dst="$2"
  rm -rf "$dst"
  ln -s "$SCRIPT_DIR/$src" "$dst"
}

link_path ".asdfrc" "$HOME/.asdfrc"
link_path ".zshrc" "$HOME/.zshrc"
link_path ".zshenv" "$HOME/.zshenv"
link_path ".zshaliases" "$HOME/.zshaliases"
link_path ".vimrc" "$HOME/.vimrc"

link_path ".config/eww" "$HOME/.config/eww"
link_path ".config/kitty" "$HOME/.config/kitty"
link_path ".config/starship.toml" "$HOME/.config/starship.toml"
link_path ".config/hypr" "$HOME/.config/hypr"
link_path ".config/nvim" "$HOME/.config/nvim"
link_path ".config/tmux" "$HOME/.config/tmux"
link_path ".config/sc-im" "$HOME/.config/sc-im"
link_path ".config/neofetch" "$HOME/.config/neofetch"
link_path ".config/easyeffects" "$HOME/.config/easyeffects"
link_path ".config/ranger" "$HOME/.config/ranger"
