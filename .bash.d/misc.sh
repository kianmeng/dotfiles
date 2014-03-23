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
