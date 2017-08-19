# Fix the issue of X session login failure where we only want to start tmux on
# shell start.
[[ $- != *i* ]] && return

# for tmux: export 256color
# @see https://wiki.archlinux.org/index.php/Tmux#Setting_the_correct_term
[ -n "$TMUX" ] && export TERM=screen-256color

# start tmux on every shell login. add this before aliases declaration
# http://bionicraptor.co/2011/07/24/how-to-automatically-launch-tmux/
if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach || tmux new; exit
fi
