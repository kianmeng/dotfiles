About
-----
A collection of configuration files for the typical console programs bash, vim,
screen, tmux, and misc. The dfm (dotfiles manager) is used to manage all the
dotfiles.  See https://github.com/justone/dotfiles for full documentation.

Install
-------
By default it should works for Ubuntu/Debian-based distos.

* sudo apt-get install git git-sh tig meld exuberant-ctags xclip mercurial vim tmux screen source-highlight apt-file terminator ack-grep
* git clone https://github.com/kianmeng/dotfiles.git
* cd dotfiles
* ./bin/dfm install
* git submodule update --init --recursive
* sudo apt-file update

Fonts
-----
The vim-powerline needs Ubuntu Mono font

* mkdir ~/.fonts 
* cd ~/.fonts/ 
* git clone https://github.com/scotu/ubuntu-mono-powerline.git 
* cd ~
