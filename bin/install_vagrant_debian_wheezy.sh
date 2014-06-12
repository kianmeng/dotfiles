#!/usr/bin/env bash
#
# Script to install Vagrant in Debian 7.5, Wheezy.
# @see https://www.vagrantup.com/downloads.html

TMP_PATH="/tmp/"
VAGRANT_ROOT_URL="https://dl.bintray.com/mitchellh/vagrant/"
VAGRANT_VERSION="1.6.3"
VAGRANT_BIN=$(command -v `which vagrant`)
VAGRANT_ARCH=$(uname -m)
VAGRANT_FILE="vagrant_"$VAGRANT_VERSION"_"$VAGRANT_ARCH".deb"

if [ ! -n "$VAGRANT_BIN" ]; then
    if [ ! -f $TMP_PATH"SHA256SUMS" ]; then
        echo "INFO: Downloading checksum file..."
        wget -O $TMP_PATH"SHA256SUMS" $VAGRANT_ROOT_URL$VAGRANT_VERSION"_SHA256SUMS?direct"
    fi

    if [ ! -f "$TMP_PATH$VAGRANT_FILE" ]; then
        echo "INFO: Downloading vagrant app..."
        wget -O $TMP_PATH$VAGRANT_FILE $VAGRANT_ROOT_URL$VAGRANT_FILE
    fi

    CHECKSUM_OK=$(cd $TMP_PATH && sha256sum -c SHA256SUMS 2>&1 | grep OK | tail -c 3)
    if [ "$CHECKSUM_OK" == "OK" ]; then
        echo "INFO: $VAGRANT_FILE checksum verified."
        echo "INFO: Installing vagrant app..."
        sudo dpkg -i $TMP_PATH$VAGRANT_FILE
        vagrant --version
    else
        echo "ERRR: $VAGRANT_FILE corrupted. Run the script to redownload."
    fi
else
    echo "INFO: $(vagrant --version) already installed."
fi
