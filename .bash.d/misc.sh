# via https://www.digitalocean.com/community/articles/an-introduction-to-useful-bash-aliases-and-functions
alias xclip='xclip -selection c'

# since ack is kanji code converter and ack-grep is the actual program for
# searching source code
alias ackg='ack-grep'

# disk /process usage
alias df="df -Tha --total"
alias du="du -ach | sort -h"
alias free="free -mt"
alias ps="ps auxf"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# search through history
alias histg="history | grep"

# what is my current ip
alias myip="curl http://ipecho.net/plain; echo"

# in Fedora, we need to declare this explicitly together with sensible-utils
# package.
export BROWSER='google-chrome'

# search Google from command line
# gg term1 term2 termN
# @see http://superuser.com/a/47216
gg() {
    search=""
    echo "Googling: $@"
    for term in $@; do
        search="$search%20$term"
    done
    sensible-browser "https://www.google.com/search?q=$search"
}

# search Google Bookmark from command line
# gb term1 term2 termN
gb() {
    search=""
    echo "Search Google Bookmark: $@"
    for term in $@; do
        search="$search+$term"
    done
    sensible-browser "https://www.google.com/bookmarks/find?q=$search"
}

# default download to 4 connections
alias download='aria2c -x 4'

# due to some idiotic reason, gnome3 hides the logout button if there're only
# one user exists in the system causing unnecesary problems if you want to try
# and switch to alternative window managers.
alias logout='gnome-session-quit'
