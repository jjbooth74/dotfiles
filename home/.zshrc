export PATH=$HOME/bin:$HOME/go/bin:/usr/local/bin:/usr/local/opt/go/libexec/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/jbooth-mac/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git osx git-extras npm tmux)

source $ZSH/oh-my-zsh.sh
unsetopt share_history # No.
setopt no_share_history # Just no.
set -o physical

export EDITOR='vim'

source ~/.alias

# RBENV setup
eval "$(rbenv init -)"

# NVM setup
# export NVM_DIR="/Users/jbooth/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# FUZZYFIND
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.config/fzf/fzf.zsh ] && source ~/.config/fzf/fzf.zsh
[ -f ~/.config/fzf/completions.zsh ] && source ~/.config/fzf/completions.zsh

# BASE16
[ -f ~/.base16.zsh ] && source ~/.base16.zsh

# TMUXINATOR
[ -f ~/.bin/tmuxinator.zsh ] && source ~/.bin/tmuxinator.zsh

# Oracle proxies is dumb
export http_proxy=http://www-proxy.us.oracle.com:80/
export https_proxy=http://www-proxy.us.oracle.com:80/
export no_proxy='localhost,127.0.0.1,.oracle.com,.oracleiaas.com,.oraclecloud.com,.oraclecorp.com,.grungy.us'
