# Fix the issue of X session login failure where we only want to start tmux on
# shell start.
[[ $- != *i* ]] && return

# Do no proceed when tmux is not installed.
if ! [ -x "$(command -v tmux)" ]; then
    return
fi

# For tmux: export 256color.
# @see https://wiki.archlinux.org/index.php/Tmux#Setting_the_correct_term
[ -n "$TMUX" ] && export TERM=screen-256color

# Start tmux on every shell login. add this before aliases declaration.
# @see http://bionicraptor.co/2011/07/24/how-to-automatically-launch-tmux/
if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach || tmux new; exit
fi

# Detach all tmux clients except the current one.
# @see https://stackoverflow.com/a/19280187
alias tmux-refresh="tmux detach -a"

# Quickly peek a file
# @see https://github.com/lf94/peek-for-tmux
peek() { tmux split-window -p 33 "$EDITOR" "$@" || exit; }
