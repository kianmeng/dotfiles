#!/usr/bin/env sh

sudo yum install -y curl git tig meld ctags xclip mercurial vim \
    tmux screen source-highlight terminator dstat htop aria2 \
    aria2 glances subversion sensible-utils most pass \
    google-noto-sans-simplified-chinese-fonts \
    google-noto-sans-traditional-chinese-fonts \
    shutter powertop tlp tlp-rdw the_silver_searcher youtube-dl

echo "Switching shell to Zsh...\n"
chsh -s `which zsh`
