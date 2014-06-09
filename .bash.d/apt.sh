# I am lazy to type these all the times
alias aptu='sudo apt-get -y update'
alias aptdu='sudo apt-get -y dist-upgrade'
alias apti='sudo apt-get -y install'
alias aptr='sudo apt-get -y remove'
alias aptar='sudo apt-get -y autoremove'
alias apts='apt-cache search'

alias aptfu='apt-file update'
alias aptfs='apt-file search'
alias aptfl='apt-file list'

# Debian wheezy-backport installation.
# Make sure you've the backport setup properly.
# $ sudo sh -c 'echo "deb http://cdn.debian.net/debian wheezy-backports main" \
#    > /etc/apt/sources.list.d/wheezy-backport.list'
#
alias aptbi='apt-get -t wheezy-backports -y install'


# Check if a program exists in the system. If not, install the necessary
# packages.
function find_app_or_install() {
    for bin in "$@";
    do
        BIN=$(command -v `which $bin`)
        echo $BIN
        if [ ! -n "$BIN" ]
        then
            echo "$bin missing. Installing $bin..."
            sudo apt-get -y install $bin
            if [ ! $? -eq 0 ]; then
                echo "Fail to apt-get install $bin..."
                exit
            fi
        fi
    done
}
