# Is better to use this to trace down issue as lxc and lxd sometimes just
# freeze there.
function lxcd() {
    if [[ $# -eq 0 ]]; then
        lxc
    else
        lxc $1 --debug --verbose "${@:2}"
    fi
}

# Enter the LXC container and launch Bash shell.
function lxcsh() {
    if [[ $# -eq 0 ]]; then
        echo "ERR: Missing container name. Cannot launch Bash Shell!"
    else
        lxcd exec $1 /bin/bash
    fi
}
