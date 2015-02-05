alias dsac='docker stop $(docker ps -a -q)'
alias dkac='docker rm $(docker ps -a -q)'
alias drun='docker run -i -t'
alias dimg='docker images'
alias drmi='docker rmi'
alias dpsa='docker ps -a'

# see http://stackoverflow.com/questions/21398087/how-to-delete-dockers-images
function dibn() {
    docker images | grep $1 | awk '{print $3}' | xargs docker rmi
}
