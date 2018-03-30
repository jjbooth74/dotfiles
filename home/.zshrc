export PATH=$HOME/bin:$HOME/go/bin:/usr/local/bin:/usr/local/opt/go/libexec/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/jbooth-mac/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(brew docker git git-extras osx pip tig tmux tmuxinator vi-mode)

source $ZSH/oh-my-zsh.sh
unsetopt share_history # No.
setopt no_share_history # Just no.
set -o physical

export EDITOR='vim'

source ~/.alias

# RBENV setup
eval "$(rbenv init -)"

# DIRENV
eval "$(direnv hook zsh)"

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
export HTTP_PROXY=http://www-proxy.us.oracle.com:80/
export HTTPS_PROXY=http://www-proxy.us.oracle.com:80/
export http_proxy=$HTTP_PROXY
export https_proxy=$HTTPS_PROXY

# Dont go through proxy for minikube
printf -v mk_ips '%s,' 192.168.99.{1..255};
export NO_PROXY="127.0.0.1,localhost,.oracle.com,.oraclecorp.com,.dev,.grungy.us,.local,.r0,.r1,.r2,.corp.dyndns.com,$mk_ips"
export no_proxy=$NO_PROXY
