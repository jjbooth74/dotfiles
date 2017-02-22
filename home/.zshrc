# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/jbooth/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# plugins=(git brew ruby gem bundler rails osx rake git-extras npm )

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

source ~/.alias

# RBENV setup
eval "$(rbenv init -)"

# NVM setup
export NVM_DIR="/Users/jbooth/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Make it possible to use base16 color schemes which is nifty.
# Unfortunately this overwrites iterm's profile settings so gotta figure that out someday.
# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
# base16_tomorrow-night # command to generate ~/.vim_background for the right colorscheme.
