export PATH=$HOME/.local/bin:$HOME/bin:$HOME/go/bin:/usr/local/bin:/usr/local/opt/go/libexec/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/josh/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"

COMPLETION_WAITING_DOTS="true"

# Don't wait for escape forever
KEYTIMEOUT=1

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(docker git git-extras pip tig tmux tmuxinator vi-mode)

source $ZSH/oh-my-zsh.sh
unsetopt share_history # No.
setopt no_share_history # Just no.
set -o physical

export EDITOR='vim'

# RBENV setup
# eval "$(rbenv init -)"

# STERN (k8s pod log streaming)
# source <(stern --completion=zsh)

# FUZZYFIND
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.config/fzf/fzf.zsh ] && source ~/.config/fzf/fzf.zsh
[ -f ~/.config/fzf/completions.zsh ] && source ~/.config/fzf/completions.zsh

# BASE16
[ -f ~/.base16.zsh ] && source ~/.base16.zsh

# TMUXINATOR
[ -f ~/.bin/tmuxinator.zsh ] && source ~/.bin/tmuxinator.zsh

# Aliases
[ -f ~/.config/shell/alias.sh ] && source ~/.config/shell/alias.sh

# THE FUCK!?
eval $(thefuck --alias)
