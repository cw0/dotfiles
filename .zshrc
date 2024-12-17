function safe_load() {
  [ -f $1 ] && source $1
}


# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Source aliases
safe_load $HOME/.zshaliases

# Source secrets
safe_load $HOME/.zshsecrets

# ZSH Options, see: https://zsh.sourceforge.io/Doc/Release/Options.html
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
# unsetopt HIST_SAVE_NO_DUPS     # Write a duplicate event to the history file
setopt APPEND_HISTORY            # Parallel Sessions won't compete for history file
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

# enable completion
zmodload zsh/complist
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

# Binds
# Use hjlk in menu selection (during completion)
# Doesn't work well with interactive mode
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

bindkey -M menuselect '^xg' clear-screen
bindkey -M menuselect '^xi' vi-insert                      # Insert
bindkey -M menuselect '^xh' accept-and-hold                # Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  # Next
bindkey -M menuselect '^xu' undo                           # Undo

# Text Objects
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# Enable Surrounding
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround

# Add asdf-vm
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
safe_load /opt/asdf-vm/asdf.sh
safe_load ~/.asdf/asdf.sh
safe_load ~/.asdf/plugins/golang/set-env.zsh
safe_load ~/.zion/zion-dev-tools/zionrc/.zionrc

safe_load ~/.zshwork

# PLUGINS
# NOTE: IF YOU WANT THIS TO WORK GO CLONE THESE
safe_load /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# git clone https://github.com/zsh-users/zsh-autosuggestions
safe_load /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
safe_load /usr/share/zsh/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh
# git clone https://github.com/softmoth/zsh-vim-mode.git

# starship
# to install / update run
# curl -sS https://starship.rs/install.sh | sh
eval "$(starship init zsh)"
