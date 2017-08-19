## About
* A collection of configuration files for the typical console programs bash,
  vim, screen, tmux, and misc.

* The dfm (dotfiles manager) is used to manage all the dotfiles.  See
  https://github.com/justone/dotfiles for full documentation.

### Installation
* By default it should works for Ubuntu/Debian-based distos.
* Use the bootstrap shell script to install all necessary packages.
$ wget -qO- https://raw.githubusercontent.com/kianmeng/dotfiles/master/bin/bootstrap.sh | bash -
* If you need the latest Vim version under Debian/Ubuntu, use the
  bin/build_latest_vim_deb.sh script to build the Debian packages.
* If you want to use [pass](http://passwordstore.org), the standard unix
  password manager. Follow these steps:
  * $ gpg --gen-key # generate the key
  * $ gpg -k        # verify your generated key
  * $ exec bash -l  # reload your bash
  * $ pass init 11223344 # 11223344 is your gpg id
  * $ pass generate test 12 # generate a test password

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

### Tmux's Key Bindings
| Shortcuts  | Description                              |
|------------|------------------------------------------|
| `          | Prefix key (backtick)                    |
| ``         | Type backtick in console.                |
| Alt+j      | Switch to left tab.                      |
| Alt+k      | Switch to right tab.                     |
| `\         | Split window vertically.                 |
| `-         | Split window horizontally.               |
| `j         | Move up to top window.                   |
| `k         | Move down to down window.                |
| `h         | Move to left window.                     |
| `l         | Move to right window.                    |
| `/         | Split a new window and man page for cmd. |
| `~         | Split a new window and run htop.         |
| `r         | Reload your .tmux.conf config file.      |
| Shift+PgUp | Show previous page.                      |

### Bash's Key Bindings
| Shortcuts  | Description                                       |
|------------|---------------------------------------------------|
| ESC        | Toggle Vi editing mode.                           |
| j/k        | Scroll history forward or backward.               |
| h/l        | Move cursor forward or backward in the line.      |

### Emacs Usages
```
$ e # start emacs in console skipping site lisp
$ ec # start emacs in console
$ ed # start emacs in console with debugging
$ emacs # start emacs in GUI mode
```

Or through daemon mode.
```
$ emacsd # start daemon
$ ecli # connect to emacs daemon
$ emacsdkill # kill emacs daemon
```

Using these prefixes (C-x, C-w, and C-h), there will be a list of key bindings
shown at the bottom.

### Miscellaneous
* In console, for quick access to regular accessed folders, just type z and
  TAB.

## Inspired by

- https://github.com/bling/dotemacs
- https://github.com/bling/emacs-evil-bootstrap.git
- https://github.com/nathantypanski/emacs.d
- https://github.com/purcell/emacs.d
- http://pages.sachachua.com/.emacs.d/Sacha.html
