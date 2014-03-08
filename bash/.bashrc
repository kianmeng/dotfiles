# for tmux: export 256color
# @see https://wiki.archlinux.org/index.php/Tmux#Setting_the_correct_term
[ -n "$TMUX" ] && export TERM=screen-256color

# Start tmux on every shell login. Add this before aliases declaration
# http://bionicraptor.co/2011/07/24/how-to-automatically-launch-tmux/
if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach || tmux new; exit
fi

# Load all the aliases or functions when you starts bash. 
# To see all aliases, type alias. 
# To see all functions, type declare -f. 
#
# To add a new alias/functions, 
# 1. create a new filename in ~/.bash.d/name_of_the_category.sh 
# 2. add your own aliases or functions and save the file
# 3. reload bash by typing source .bashrc
if [ -d ~/.bash.d ]; then
  for f in ~/.bash.d/*.sh; do
    if [ -r $f ]; then
      source $f
    fi
  done
  unset f
fi

export PATH=~/bin:$PATH
export HISTCONTROL=ignoreboth
export HISTSIZE=100000000000

PROMPT="[\[\e[34m\]\u@\h\[\e[0m\]][\[\e[32m\]\w\[\e[0m\]]\n"
if [ $(id -u) -eq 0 ]; then
    PS1="${PROMPT}# "
else
    PS1="${PROMPT}$ "
fi

# less config
# 
# source code highlighting
# $ apt-get install source-highlight
# see http://linux-tips.org/article/78/syntax-highlighting-in-less
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"

# -rR option is tell less to interpret those color codes and escape sequences
# see http://unix.stackexchange.com/questions/19317/can-less-retain-colored-output
export LESS="-iMSx4 -rRFX"

# mysql prompt setting
export MYSQL_PS1="\u@\h [\d]> "
export PAGER=less

# repeat a command n times
repeat() {
    n=$1
    shift
    while [ $(( n -= 1 )) -ge 0 ]
    do
        "$@"
    done
}

# enable vi input mode
# press ESC, j or k to scroll history, i to insert
set -o vi

export EDITOR=vi
