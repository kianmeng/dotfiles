#!/usr/bin/env bash
#
# Bootstrap the dotfiles installation

echo -e "Install essential packages...\n"
sudo apt-get install git git-sh tig meld exuberant-ctags xclip mercurial vim \
    tmux screen source-highlight apt-file terminator ack-grep ipython ncdu pydf \
    dstat htop speedometer aria2

echo "Clone the dotfiles repository and create soft links...\n"
git clone https://github.com/kianmeng/dotfiles.git
cd dotfiles
./bin/dfm install

echo -e "Update Deb packaing details...\n"
sudo apt-file update

echo "Update font cache...\n"
fc-cache -vf ~/.fonts

echo -e "Install essential Python modules...\n"
sudo pip install awesome_print virtualenvwrapper flake8 Glances

echo -e "Install all Vim's plugins...\n"
vim +BundleInstall +qall

echo -e "Done! Enjoy!\n"
