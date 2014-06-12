#!/usr/bin/env bash
#
# Script to install Virtual Box in Debian 7.5, Wheezy.
# @see https://wiki.debian.org/VirtualBox#Debian_7_.22Wheezy.22

CODENAME="wheezy"
VIRTUALBOX_BIN=$(command -v `which virtualbox`)

if [ ! -n "$VIRTUALBOX_BIN" ]; then
    sudo sh -c 'echo "deb http://http.debian.net/debian/ $CODENAME-backports main contrib" > \
        /etc/apt/sources.list.d/$CODENAME-backports.list'
    sudo apt-get update
    sudo apt-get install linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,')
    sudo apt-get -t wheezy-backports install -y virtualbox
else
    echo "INFO: Virtual Box $(vboxmanage --version) already installed."
fi
