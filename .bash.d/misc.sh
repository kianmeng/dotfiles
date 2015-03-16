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

# force quit of current session if gnome-session or other sessio manager is not
# available. there is no accurate way to detect the current display manager,
# hence i'll assume the default is gdm.
# see http://askubuntu.com/a/92557
DEFAULT_DM='xdm'
[[ -n $(command -v gdm) ]] && DEFAULT_DM='gdm'
[[ -n $(command -v kdm) ]] && DEFAULT_DM='kdm'
[[ -n $(command -v lighdm) ]] && DEFAULT_DM='lightdm'
alias forcelogout='sudo service $DEFAULT_DM restart'

# some weirdness in gnome in fedora 22 with missing lock icon button.
alias lockscreen='xscreensaver-command --lock'

# quick file server
alias fileserver='python -m SimpleHTTPServer'

# quick reload .bashrc
alias reloadbash='. ~/.bashrc'

# toggle left or right-handed mouse pointer
alias lhand='xmodmap -e "pointer = 3 2 1"'
alias rhand='xmodmap -e "pointer = 1 2 3"'

# color for manpages
# @see http://serverfault.com/a/12391
export PAGER="/usr/bin/most -s"

# sudo tail. 'nuff said.
alias stail='sudo tail -f'

# history and grep
alias hgrep='history | grep'

# screen dimention, for me to find the right resolution for wallpaper
alias screensize='xdpyinfo | grep dimensions'
