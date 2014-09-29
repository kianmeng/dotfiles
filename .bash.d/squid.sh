# helper functions to setup Squid to capture all traffic from port 80 to Squid
# proxy server on port 3128.

function iptables_reset() {
    sudo service iptables stop
    sudo service iptables start
    sudo iptables -nvL
}

function squid_start_nat() {
    iptables_reset

    # only accept those request from Squid, otherwise we'll have infinite looping.
    gid=`id -g squid`
    sudo iptables -t nat -A OUTPUT -p tcp --dport 80 -m owner --gid-owner $gid -j ACCEPT
    sudo iptables -t nat -A OUTPUT -p tcp --dport 80 -j DNAT --to-destination 127.0.0.1:3128
    sudo iptables -t nat -L
}
