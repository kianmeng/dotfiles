about
-----
A collection of configuration files for the typical console programs bash, vim,
screen, and misc. 

use it
------
Please **BACKUP** your existing dot files before you clone the repo. The safest
way is to create a fresh new user account to try it out. 

* sudo apt-get install rubygems exuberant-ctags
* sudo gem install homesick
* /var/lib/gems/1.8/bin/homesick clone https://github.com/kenmin/dotfiles.git
* /var/lib/gems/1.8/bin/homesick symlink dotfiles
* cd ~/.homesick/repos/dotfiles
* git submodule update --init --recursive
