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

# wrapper for tmuxinator but with additional installation checking for fresh
# new installation.
#
function tmuxinator() {
    RUBY193_BIN=$(command -v `which ruby1.9.3`)
    if [ ! -n "$RUBY193_BIN" ]
    then
        echo "Ruby 1.9.3 missing. Installing ruby1.9.3..."
        sudo apt-get install ruby1.9.3 ruby-switch
        # in Debian 7.5 Wheezy, while the package name is 1.9.3, it's still a
        # softlink to version 1.9.1.
        sudo ruby-switch --set ruby1.9.1
    fi

    TMUXINATOR_BIN=$(command -v `which tmuxinator`)
    if [ ! -n "$TMUXINATOR_BIN" ] 
    then
        echo "tmuxinator missing. Installing tmuxinator gem..."
        sudo gem install tmuxinator --verbose

        echo "Checking everything is okay..."
        `which tmuxinator` doctor
        return
    fi

    `which tmuxinator` "$@"
}

# another wrapper for the alias mux so we can check for installation.
#
function mux() {
    tmuxinator "$@"
}
