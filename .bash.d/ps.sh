# show process listing with tree
alias ps='ps auxf'

# search prcess using grep
# @see https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# kill process forcefully
alias kill9='kill -9'

# kill process by port number
# @see http://unix.stackexchange.com/a/92721
function killport() { 
    sudo kill -9 $(sudo fuser -n tcp $1 2> /dev/null);
}
