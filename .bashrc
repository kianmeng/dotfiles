# bash shell history settings
# @see https://news.ycombinator.com/item?id=9869971
export HISTCONTROL=ignoreboth  # ignore leading whitespaces entries and dupes.
export HISTSIZE=100000000000   # almost infinity history size for self-analysis later.
export HISTTIMEFORMAT="%F %T " # add timestamp
shopt -s histappend            # Append history to file, don't overwrite.
shopt -s histverify            # Show expanded history before running it.
shopt -s cmdhist               # Store multiline cmds as single

# default editor.
export EDITOR=vi

# enable vi input mode.
# press ESC, j or k to scroll history, i to insert
# to confirm the setting, run set -o | grep -E "(emacs|vi)"
set -o vi

# forget about typing cd ever again.
# @see http://askubuntu.com/a/297987
shopt -s autocd

# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# perl
cpanm --local-lib=~/perl5 local::lib \
    && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
