# via https://www.digitalocean.com/community/articles/an-introduction-to-useful-bash-aliases-and-functions

# directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir="mkdir -pv"

# strip trailing newline from the copied path so that it won't auto-run in the
# terminal.
# @see http://stackoverflow.com/a/15690006
alias cpwd="pwd | tr -d '\n' | xclip"

# file listing
alias ls='ls --color --group-directories-first -p -CF';
alias ll='ls -lh --color --group-directories-first';
alias lsa='ls -ahCF --group-directories-first';
alias lla='ls -alh --group-directories-first';

# list and find files/folders
# see http://chneukirchen.org/blog/archive/2013/07/summer-of-scripts-l-and-lr.html
lf() {
  local p=$argv[-1]
  [[ -d $p ]] && { argv[-1]=(); } || p='.'
  find $p ! -type d | sed 's:^./::' | egrep "${@:-.}"
}

# search and replace
# @see http://www.reddit.com/r/programming/comments/2tj6d6/findrep_easy_tool_to_find_and_replace/cnzy34o
function findreplace { 
    if [ ! $# == 2 ]; then 
        echo "Usage: find_replace <search_string> <replace_string>"
        return -1
    fi
    find . -type f -print0 | xargs -0 sed -i "s/$1/$2/g"
}

# open any file or url in preferred application.
# @see https://news.ycombinator.com/item?id=9869540
alias open='xdg-open'

# extract any archives file using single alias.
alias xx='atool -x'

# i should have add this alias long ago
alias rmrf='rm -rf'

# list file permissions in octal
# @see http://www.shell-fu.org/lister.php?id=205
alias lso="ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g'"

# list file by inode number
alias lsi='ls -il'

# delete a file by its inode number
# @see http://www.shell-fu.org/lister.php?id=232
function rminode() {
    find . -inum $1 -delete
}

# unrar does not work with xargs
alias unrarall='for f in *.rar; do unrar e -y "$f"; done'
