function bootstrap_fedora_packages () {
    if [[ $(python -mplatform | grep -i fedora) ]];
    then
        sudo yum install -y git tig meld ctags xclip mercurial vim \
            tmux screen source-highlight terminator dstat htop aria2 \
            aria2 python-virtualenv python-virtualenvwrapper \
            python-flake8 glances subversion sensible-utils most pass \
            google-noto-sans-simplified-chinese-fonts \
            google-noto-sans-traditional-chinese-fonts \
            shutter powertop tlp tlp-rdw the_silver_searcher youtube-dl \
            emacs
    fi
}

function bootstrap_ubuntu_packages () {
    if [[ $(python -mplatform | grep -i ubuntu) ]];
    then
        sudo apt-get install -y git git-sh tig meld exuberant-ctags xclip mercurial vim \
            tmux screen source-highlight terminator ack-grep ipython ncdu pydf \
            dstat htop speedometer aria2 subversion most i3-wm i3status i3lock \
            ttf-dejavu fonts-droid fonts-cantarell youtube-dl \
            shutter powertop silversearcher-ag pass ppa-purge \
            libimage-exiftool-perl ranger atool

        echo -e "Installing TLP...\n"
        sudo add-apt-repository ppa:linrunner/tlp
        sudo apt-get update
        sudo apt-get install tlp tlp-rdw
        sudo apt-get install tp-smapi-dkms acpi-call-dkms

        echo -e "Install CJK-related packages...\n"
        sudo apt-get install fonts-wqy-* fonts-arphic-* fcitx fcitx-sunpinyin

        echo -e "Update Deb packaging details...\n"
        sudo apt-get install apt-file
        sudo apt-file update

        echo "Update font cache...\n"
        fc-cache -vf ~/.fonts

        echo -e "Install essential Python modules...\n"
        sudo apt-get install libpython-dev python-pip
        sudo pip install awesome_print virtualenvwrapper flake8 Glances
    fi
}
