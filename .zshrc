function safe_load() {
  [ -f $1 ] && source $1
}

safe_load ${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh
safe_load /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
safe_load /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


ZSH_THEME="powerlevel10k/powerlevel10k"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git vi-mode)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Launch oh-my-zsh
safe_load $ZSH/oh-my-zsh.sh
#
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
safe_load ~/.p10k.zsh

# Source aliases
safe_load $HOME/.zshaliases

# Source secrets
safe_load $HOME/.zshsecrets


# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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
safe_load /opt/asdf-vm/asdf.sh
safe_load ~/.asdf/asdf.sh
safe_load ~/.asdf/plugins/golang/set-env.zsh
safe_load ~/.zion/zion-dev-tools/zionrc/.zionrc

safe_load ~/.zshwork

# TDOD Move all of this to something more worky
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$PATH:~/go/bin"
export PATH="$PATH:$(python3 -m site --user-base)/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

# coreutils fix
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

export PATH="$HOME/.poetry/bin:$PATH"
# safe_load /usr/share/nvm/init-nvm.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

safe_load ~/.rvm/scripts/rvm
