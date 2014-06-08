#!/usr/bin/env bash
#
# Setup the Dnsmasq for local developmnet. For Debian and Ubuntu.
#
# Usage:
#     $ setup_dnsmasq_local_dev.sh
#     $ setup_dnsmasq_local_dev.sh lan
#
# @see http://passingcuriosity.com/2013/dnsmasq-dev-osx/
# @see http://superuser.com/a/246841
# @see http://stackoverflow.com/a/82278
# @see http://serverfault.com/a/136379
# @see http://stackoverflow.com/a/638980

DEBUG=false
TLD='dev'
if [ -z "$1" ]; then
    echo "No TLD supplied. Default to '.$TLD'."
else
    if [[ "$1" == *".local" ]]; then
        echo "Invalid TLD: cannot ends with .local"
        exit
    fi
    TLD="$1"
fi

echo "All domains queried with .$TLD will resolved to 127.0.0.1."
echo ""

if [[ ! -f /etc/init.d/dnsmasq ]]; then
    sudo apt-get install dnsmasq
fi

sudo sh -c "echo 'address=/.$TLD/127.0.0.1' > /etc/dnsmasq.d/localhost.$TLD"
sudo sed -i '1inameserver 127.0.0.1' /etc/resolv.conf

# restart is compulsory to update these changes.
sudo service dnsmasq restart

if $DEBUG; then
    # check if dnsmasq is running and listening to port 53.
    echo ""
    netstat -plant | grep :53

    # again but using lsof.
    echo ""
    sudo lsof -i | grep dnsmasq

    # check out query
    echo ""
    dig foobar.$TLD @127.0.0.1| grep IN
    nslookup foobar.$TLD localhost
fi

# ping any random domain names end with .dev
echo ""
ping -c 2 foobar.$TLD

echo ""
ping -c 2 www.foobar.$TLD
