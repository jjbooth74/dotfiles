fzf-go-widget() {

  local gopath="$(go env GOPATH)"
  local cmd="${FZF_ALT_C_COMMAND:-"command find -L $gopath -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | sed 's~^$gopath~~'"}"

  # setopt localoptions pipefail 2> /dev/null

  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" fzf-tmux -d${FZF_TMUX_HEIGHT:-40%} +m)"
  if [[ -z "$gopath$dir" ]]; then
    zle redisplay
    return 0
  fi
  cd "$gopath$dir"
  local ret=$?
  zle reset-prompt
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret

}

zle -N fzf-go-widget
bindkey '^G' fzf-go-widget
