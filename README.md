About
-----
A collection of configuration files for the typical console programs bash, vim,
screen, tmux, and misc. 

Install
-------
Please **BACKUP** your existing dot files before you clone the repo. The safest
way is to create a fresh new user account to try it out. By default it should
works for Ubuntu 12.04 and later release.

* sudo apt-get install git rubygems exuberant-ctags xclip mercurial vim tmux screen source-highlight apt-file
* sudo gem install homesick
* homesick clone https://github.com/kianmeng/dotfiles.git
* homesick symlink dotfiles
* cd ~/.homesick/repos/dotfiles
* git submodule update --init --recursive
* sudo apt-file update

Fonts
-----
The vim-powerline needs Ubuntu Mono font

* mkdir ~/.fonts 
* cd ~/.fonts/ 
* git clone https://github.com/scotu/ubuntu-mono-powerline.git 
* cd ~
