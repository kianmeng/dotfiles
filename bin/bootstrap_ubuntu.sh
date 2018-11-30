#!/usr/bin/env sh

echo -e "Installing essential packages...\n"
sudo apt-get install -y \
    curl git git-sh tig meld exuberant-ctags \
    xclip mercurial vim tmux screen source-highlight terminator \
    ack-grep pydf dstat htop speedometer aria2 subversion most \
    ttf-dejavu fonts-droid-fallback fonts-cantarell youtube-dl \
    shutter powertop silversearcher-ag pass ppa-purge \
    libimage-exiftool-perl ranger atool python-pip \
    powerline fonts-powerline

echo -e "Installing TLP...\n"
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install -y tlp tlp-rdw
sudo apt-get install -y tp-smapi-dkms acpi-call-dkms

echo -e "Installing CJK-related packages...\n"
sudo apt-get install -y fonts-wqy-* fonts-arphic-* fonts-noto

echo -e "Update Deb packaging details...\n"
sudo apt-get install apt-file
sudo apt-file update

echo "Update font cache...\n"
fc-cache -vf ~/.fonts

echo "Switching shell to Zsh...\n"
chsh -s `which zsh`
