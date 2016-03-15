
#Some environment variables:
export EDITOR="$HOME/bin/subl -w -n"

# change prompt
[[ -s "/Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh" ]] && source "/Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh"
export PS1="\n\n:::: \[\033[1;35m\]\w\[\033[0m\] ::\[\033[32m\]\$(__git_ps1)\[\033[0m\] ::::\n:: \[\033[4;33m\]\A :: \!\[\033[0m\] $ "

#RVM Stuff:
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile


#Source some useful files:
[[ -s "$HOME/.alias" ]] && source "$HOME/.alias" #Load my bash aliases

[[ -s $(brew --prefix)/etc/bash_completion ]] && . $(brew --prefix)/etc/bash_completion #Load git auto-completion

# Add some useful PATH things:
[[ -s "$HOME/bin" ]] && export PATH=$PATH:$HOME/bin
#export PATH=/usr/local/bin:$PATH
