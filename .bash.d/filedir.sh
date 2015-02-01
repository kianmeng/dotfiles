# via https://www.digitalocean.com/community/articles/an-introduction-to-useful-bash-aliases-and-functions

# directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir="mkdir -pv"

# file listing
alias ls='ls --color --group-directories-first -p -CF';
alias ll='ls -lh --color';
alias lsa='ls -ahCF';
alias lla='ls -alh';

# search and replace
# @see http://www.reddit.com/r/programming/comments/2tj6d6/findrep_easy_tool_to_find_and_replace/cnzy34o
function findreplace { 
    if [ ! $# == 2 ]; then 
        echo "Usage: find_replace <search_string> <replace_string>"
        return -1
    fi
    find . -type f -print0 | xargs -0 sed -i "s/$1/$2/g"
}
