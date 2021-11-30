# Dotfiles

## Summary:

The setup.sh script updates packages and then installs the following utilities:

- git
- tmux
- build-essential
- gcc
- procps
- curl
- file
- ruby-full

Afterwards it installs homebrew and then installs:

- zsh
- oh my zsh
- roboto mono nerd font
- powerlevel 10k
- colorls
- nvm
- vim w/ python3 support

Finally it deletes existing config files and replaces the following config files with symlinks to config files in this repo.

- ~/.zshrc
- ~/.p10k.zsh
- ~/.vimrc
- ~/.config/kitty/kitty.conf

> NOTE: If you plan on adding environment variables to your .zshrc please remove the symlink and copy the file manually instead

## Setup:

### Linux:

```bash
chmod +x setup.sh
./setup.sh
```

### Docker:

```bash
docker build -t 'dev-env' .
```

### TODO

- install i3-gaps
- install polybar
- install neofetch
- install calcurse
- install asciiquarium
- install weatherspect
- install wtfutils
- arrange configs specific to os / computer
