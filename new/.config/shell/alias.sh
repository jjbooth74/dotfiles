alias vim="nvim"

#nav:
alias ls="ls -aFG --color=auto"
alias cls="clear;printf '\n';pwd;printf '\n';ls -FG"
alias ..="cd .."
alias up="clear;cd ..;pwd;ls -FG"
dev() { 
  cd ~/Development

  if [[ ! -z "$1" ]]
  then
    # clone the repo if we don't already have it
    [[ ! -d "$1" ]] && clone $1;
    cd $1;
  fi

  clear;
  printf '\n';
  pwd;
  printf '\n';
  ([[ -d ".git" ]] && git status);
}
compctl -/ -W ~/Development dev
alias devtools="dev devtools"
alias path="tr ':' '\\n' <<< \"$PATH\""

#profile:
alias profile="$EDITOR ~/.zshrc"
alias aliases="$EDITOR ~/.config/shell/alias.sh"
alias refresh="source ~/.zshrc"

#git:
alias pull="git pull --ff-only origin"
alias fetch="git fetch --all"
alias status="git status"
alias master="git checkout master; echo 'Did you mean develop?';"
alias develop="git checkout develop"
alias d="develop"
clone() { git clone git@github.com:${2:-algorithmiaio}/$1; }

#k8s:
alias k="kubectl"

#ruby:
alias rd="RAILS_ENVIRONMENT=development"
alias be="bundle exec"

#go:
# alias gogo="cd \"$(go env GOPATH)\""
# alias god="gogo"
# alias gop="gogo"
# alias gos="cd \"$(go env GOPATH)/src\""

#colors:
alias reset_base16="source ~/.base16.zsh"

#tmux:
alias tmux="tmux -u"

#onepassword:
onepass() { op get item $1 | jq -r '.details.fields[] | select(.designation=="password").value' | tr -d '\n' }

#music
alias music="ncmpcpp"
