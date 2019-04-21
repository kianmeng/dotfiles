# ignore leading whitespaces entries and dupes
export HISTCONTROL=ignoreboth

# almost infinity history size for self-analysis later
export HISTSIZE=100000000000

# add timestamp
export HISTTIMEFORMAT="%F %T "

# append history to file, don't overwrite
shopt -s histappend

# show expanded history before running it
shopt -s histverify

# store multiline cmds as single
shopt -s cmdhist

# no need to type 'cd' to directory
shopt -s autocd

# default editor
export EDITOR=vi

# enable vi input mode
# press ESC, j or k to scroll history, i to insert
# to confirm the setting, run set -o | grep -E "(emacs|vi)"
set -o vi

# make less readable
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'

# tmux
# fix the issue of X session login failure where we only want to start tmux on
# shell start
[[ $- != *i* ]] && return

# export 256color
# @see https://wiki.archlinux.org/index.php/Tmux#Setting_the_correct_term
[ -n "$TMUX" ] && export TERM=screen-256color

# start tmux on every shell login
# add this before aliases declaration
# @see http://bionicraptor.co/2011/07/24/how-to-automatically-launch-tmux/
if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach || tmux new; exit
fi

# common aliases
alias c='clear'
alias r='reset'
alias q='exit'

alias svi='sudo vim'
alias v='vim'

alias ps='ps auxf'
alias grepi='grep -i'

alias xclip='xclip -selection c'
alias download='aria2c -x 4'
alias ytmp3='youtube-dl --extract-audio --audio-format mp3'

# file & directory
alias ls='ls --color --group-directories-first -p -CF';
alias ll='ls -lh --color --group-directories-first';
alias lsa='ls -ahCF --group-directories-first';
alias lla='ls -alh --group-directories-first';
alias rmrf='rm -rf'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir="mkdir -pv"

# apt
alias aptu='sudo apt -y update'
alias apti='sudo apt -y install'
alias aptr='sudo apt -y remove'
alias apts='apt-cache search'

alias aptdu='sudo apt -y dist-upgrade'
alias aptar='sudo apt -y autoremove'

alias aptfu='sudo apt-file update'
alias aptfs='apt-file search'
alias aptfl='apt-file list'

# git
# autocomplete for 'g' as well
# see http://nuclearsquid.com/writings/git-tricks-tips-workflows/
alias g='git'
complete -o default -o nospace -F _git g

# git prompt. Only in Ubuntu.
if [ -e '/etc/bash_completion.d/git-prompt' ]; then
    source /etc/bash_completion.d/git-prompt
    export GIT_PS1_SHOWDIRTYSTATE=1
    export PS1='\u@\h: \w$(__git_ps1 " (%s)")\$ '
fi

# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# docker
alias dm='docker-machine'
alias dmls='docker-machine ls'
alias dmenv='env | grep -i ^DOCKER'

function dmstopall() {
    local names=$(docker-machine ls | grep Running | awk '{print $1}')
    docker-machine stop $names
    docker-machine ls
}

function dmswitch() {
    local name="${1:-default}"
    local status=$(docker-machine status $name)
    if [ "$status" = "Stopped" ]; then
        docker-machine start $name
    fi
    eval $(docker-machine env $name)
    env | grep -i ^DOCKER
}

## perl
cpanm --local-lib=~/perl5 local::lib \
    && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
