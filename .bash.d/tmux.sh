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
function tmuxinator(){
    RUBY_GEM_BIN=$(command -v `which gem`)
    if [ ! -n "$RUBY_GEM_BIN" ] 
    then
        echo "rubygems missing. Installing rubygems..."
        sudo apt-get install rubygems
    fi

    TMUXINATOR_BIN=$(command -v `which tmuxinator`)
    if [ ! -n "$TMUXINATOR_BIN" ] 
    then
        echo "tmuxinator missing. Installing tmuxinator gem..."
        sudo gem install tmuxinator

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
