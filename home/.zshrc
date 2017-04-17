# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/jbooth/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git brew ruby gem bundler rails osx rake git-extras npm tmux)

source $ZSH/oh-my-zsh.sh
unsetopt share_history # No.
setopt no_share_history # Just no.

export EDITOR='vim'
export POWERLINE="$(pip show powerline-status | grep Location: | sed -e 's/^Location: //')"

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

PATH="/Users/jbooth/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/jbooth/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/jbooth/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/jbooth/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/jbooth/perl5"; export PERL_MM_OPT;
