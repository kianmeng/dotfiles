## bash
export HISTCONTROL=ignoreboth   # ignore leading whitespaces entries and dupes
export HISTSIZE=100000000000    # almost infinity history size for self-analysis later
export HISTTIMEFORMAT="%F %T "  # add timestamp
PROMPT_DIRTRIM=2                # shorter prompt path

shopt -s histappend # append history to file, don't overwrite
shopt -s histverify # show expanded history before running it
shopt -s cmdhist    # store multiline cmds as single
shopt -s autocd     # no need to type 'cd' to directory

# enable vi input mode
# press ESC, j or k to scroll history, i to insert
# to confirm the setting, run set -o | grep -E "(emacs|vi)"
export EDITOR=vi
set -o vi
alias vv='vim -u NONE -U NONE -N -i NONE'

# personal binary path
[[ -d $HOME/bin ]] && PATH=$PATH:$HOME/bin
[[ -d $HOME/.local/bin ]] && PATH=$PATH:$HOME/.local/bin
[[ -d $MIX_HOME ]] && PATH=$PATH:$MIX_HOME

# make less readable
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'

## tmux
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

## aliases
alias c='clear'
alias r='reset'
alias q='exit'
alias rl='source ~/.bashrc'
alias rg='rg --pretty'
alias rgl='rg -l'

alias xclip='xclip -selection c'
alias download='aria2c -x 4'
alias yt='youtube-dl'
alias ytmp3='youtube-dl --extract-audio --audio-format mp3'

# file & directory
alias ls='ls --color --group-directories-first -p -ahCFX';
alias ll='ls --color --group-directories-first -lh';
alias rmrf='rm -rf'
alias repo='cd $HOME/src'
alias df='df -hx "squashfs"' # snap is polluting my df

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
alias aptarp='sudo apt -y autoremove --purge'

alias aptfu='sudo apt-file update'
alias aptfs='apt-file search'
alias aptfl='apt-file list'

# git
## autocomplete for 'g' as well
## see http://nuclearsquid.com/writings/git-tricks-tips-workflows/
complete -o default -o nospace -F _git g
alias g='git'
alias gitk='gitk&'

## git prompt, only in Ubuntu.
if [ -e '/etc/bash_completion.d/git-prompt' ]; then
    source /etc/bash_completion.d/git-prompt
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWSTASHSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_SHOWUPSTREAM="auto verbose"
    export GIT_PS1_HIDE_IF_PWD_IGNORED=true
    export GIT_PS1_SHOWCOLORHINTS=true
    export PS1='\u@\h: \w$(__git_ps1 " (%s)")\$ '
fi

## Switch Git repo URL to my own account origin.
## from: https://github.com/lxc/linuxcontainers.org.git
## to: git@github.com:kianmeng/linuxcontainers.org.git
function git_switch_url {
    echo "Before: ---"
    git remote -v

    origin_url=$(git remote get-url origin)
    new_origin_url=$(echo $origin_url | sed 's/https:\/\/github.com\/\w*/git@github\.com:kianmeng/g')
    git remote add upstream $origin_url
    git remote set-url origin $new_origin_url

    echo -e "\nAfter: ---"
    git remote -v
}

## repo for my own dotfiles
alias hgit='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# elixir
export ERL_AFLAGS="-kernel shell_history enabled"
alias iex='EDITOR=vi iex'
alias iexm='EDITOR=vi iex -S mix'

# erlang
alias redoci='rebar3 ex_doc; epiphany doc/index.html&'
alias redoc='rebar3 ex_doc&'

# python
alias ipy='ipython3'
alias psql='pgcli'
alias pycov='pytest --cov-report term-missing --cov=$(basename `pwd`) --cov-report html tests'
alias pycovi='pycov && epiphany htmlcov/index.html &'

if [[ -d $HOME/.pyenv ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# custom bash settings
if [ -e "$HOME/.bashrc.personal" ]; then
    source "$HOME/.bashrc.personal"
fi
