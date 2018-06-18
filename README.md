## About
* A collection of configuration files for the typical console programs bash,
  vim, screen, tmux, and misc.
* Dotfiles management through Git following this [blog
  post](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
  and [HN post](https://news.ycombinator.com/item?id=11070797).


### Installation
* Clone and repository.
  ```
  $ alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

  $ git clone --bare git@github.com:kianmeng/dotfiles.git $HOME/.cfg

  # Backup all your existing dotfiles, if any.
  $ mkdir -p .config-backup && \
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
  xargs -I{} mv {} .config-backup/{}

  $ config checkout

  # Reload Bash and install all the necessary packages.
  $ source ~/.bashrc
  $ bootstrap_packages
  ```

* If you want to use [pass](http://passwordstore.org), the standard unix
  password manager. Follow these steps:

  ```
  # generate the key
  $ gpg --gen-key

  # verify your generated key
  $ gpg -k

  # reload your bash
  $ exec bash -l

  # 11223344 is your gpg id
  $ pass init 11223344

  # generate a test password
  $ pass generate test 12
  ```

* To manage these dot files, just use the `config` alias which is a wrapper to
  `git`.

### Vim's Key Bindings
| Shortcuts | Description                              |
|-----------|------------------------------------------|
| ,         | Leader key                               |
| jj        | Exist from insert mode into normal mode. |
| ,p        | Toggle between Paste and normal mode.    |
| ,l        | Cycle between buffers.                   |
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

### Miscellaneous
* In console, for quick access to regular accessed folders, just type z and
  TAB.
