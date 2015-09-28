# Is better to use this to trace down issue as lxc and lxd sometimes just
# freeze there.
function lxcd() {
    if [[ $# -eq 0 ]]; then
        lxc
    else
        lxc $1 --debug --verbose "${@:2}"
    fi
}
