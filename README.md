## About
* A collection of configuration files for the typical console programs bash,
  vim, screen, tmux, and misc. 

* The dfm (dotfiles manager) is used to manage all the dotfiles.  See
  https://github.com/justone/dotfiles for full documentation.

### Installation
* By default it should works for Ubuntu/Debian-based distos. 
* Use the bootstrap shell script to install all necessary packages.
$ wget -qO- https://raw.githubusercontent.com/kianmeng/dotfiles/master/bin/bootstrap.sh | bash -
* If you need the latest Vim version under Debian, use the
  bin/debian_75_build_vim.sh script to build the Deb packages.

### Vim's Key Bindings
| Shortcuts | Description                              |
|-----------|------------------------------------------|
| ,         | Leader key                               |
| jj        | Exist from insert mode into normal mode. |
| ,p        | Toggle between Paste and normal mode.    |
| ,l        | Cycle between buffers.                   |
| ,t        | Show tag list.                           |
| ,nn       | Show NERDTree file manager.              |
| ,bb       | Start Bash shell in another tab.         |
| ,pp       | Start PostgreSQL prompt in another tab.  |
| ,mm       | Start MySQL prompt in another tab.       |
| :w!!      | Save file with root privileges.          |
