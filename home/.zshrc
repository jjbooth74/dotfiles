export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/jbooth-mac/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git brew ruby gem bundler rails osx rake git-extras npm tmux)

source $ZSH/oh-my-zsh.sh
unsetopt share_history # No.
setopt no_share_history # Just no.

export EDITOR='vim'

source ~/.alias

# RBENV setup
eval "$(rbenv init -)"

# NVM setup
# export NVM_DIR="/Users/jbooth/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# FUZZYFIND
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# BASE16
[ -f ~/.base16.zsh ] && source ~/.base16.zsh

# TMUXINATOR
[ -f ~/.bin/tmuxinator.zsh ] && source ~/.bin/tmuxinator.zsh
