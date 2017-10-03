# Make it possible to use base16 color schemes which is nifty.
# Unfortunately this overwrites iterm's profile settings so gotta figure that out someday.
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_eighties # command to generate ~/.vim_background for the right colorscheme.
