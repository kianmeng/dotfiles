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
