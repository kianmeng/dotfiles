alias dcps='docker-compose ps'
alias dcrm='docker-compose rm -vfs'

function dup() {
    docker images | grep -v REPO | awk '{print $1":"$2}' | xargs -n 1 docker pull
}
