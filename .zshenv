# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL="vim"
else
  export EDITOR='nvim'
  export VISUAL="nvim"
fi

# vim mode
export KEYTIMEOUT=1

# History settings
export HISTFILE="$HOME/.zhistory"       # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# Fix cursor when swapping panes
export VI_MODE_SET_CURSOR=true
export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

export MANPAGER="nvim +Man! -c ':set signcolumn=auto'"
. "$HOME/.cargo/env"

# Path Settings
export PATH="/usr/local/bin:$PATH"
