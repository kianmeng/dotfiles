About
-----
A collection of configuration files for the typical console programs bash, vim,
screen, tmux, and misc. 

Install
-------
Please **BACKUP** your existing dot files before you clone the repo. The safest
way is to create a fresh new user account to try it out. By default it should
works for Ubuntu 12.04 / Debian 7 and later release.

* sudo apt-get install git stow exuberant-ctags xclip mercurial vim tmux screen source-highlight apt-file terminator
* git clone https://github.com/kianmeng/dotfiles.git
* cd dotfiles
* stow -vv bash vim tmux screen
* git submodule update --init --recursive
* sudo apt-file update

Fonts
-----
The vim-powerline needs Ubuntu Mono font

* mkdir ~/.fonts 
* cd ~/.fonts/ 
* git clone https://github.com/scotu/ubuntu-mono-powerline.git 
* cd ~
