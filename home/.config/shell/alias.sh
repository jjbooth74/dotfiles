# for now?
alias vim="nvim"
#nav:
alias ls="ls -aFG"
alias cls="clear;printf '\n';pwd;printf '\n';ls -FG"
alias ..="cd .."
alias up="clear;cd ..;pwd;ls -FG"
dev() { cd ~/Development/$1;clear;printf '\n';pwd;printf '\n';git status; }
compctl -/ -W ~/Development dev
alias path="tr ':' '\\n' <<< \"$PATH\""
alias pg="ps ax | grep"

#profile:
alias profile="$EDITOR ~/.zshrc"
alias aliases="$EDITOR ~/.config/shell/alias.sh"
alias refresh="source ~/.zshrc"

#git:
alias pull="git pull --ff-only origin"
alias fetch="git fetch --all"
alias status="git status"
alias master="git checkout master"

#ruby:
alias rd="RAILS_ENVIRONMENT=development"
alias be="bundle exec"

#go:
alias gogo="cd \"$(go env GOPATH)\""
alias god="gogo"
alias gop="gogo"
alias gos="cd \"$(go env GOPATH)/src\""

#colors:
alias reset_base16="source ~/.base16.zsh"

#tmux:
alias tmux="tmux -u"

#onepassword:
onepass() { op get item $1 | jq -r '.details.fields[] | select(.designation=="password").value' | tr -d '\n' }

#music
alias music="ncmpcpp"

#mcafee
firewall_stop() {
   res=$(sudo /usr/local/McAfee/StatefulFirewall/bin/StatefullFirewallControl status)
   echo "McAfee :" $res
   running="is running"
   if [[ $res = *$running* ]]; then
      echo "Stop McAfee Firewall temporarily"
      sudo /usr/local/McAfee/StatefulFirewall/bin/StatefullFirewallControl stop
   fi
}

alias mcstop='firewall_stop'
