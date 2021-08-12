## There is no place like $HOME
A collection of configuration files for the typical console programs bash, vim,
screen, tmux, and misc.

Dotfiles management through Git following this [blog post](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/) and [HN post](https://news.ycombinator.com/item?id=11070797).

### Installation

Setup the alias:
```bash
$ alias hgit='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Clone the repository:
```bash
$ hgit clone --bare git@github.com:kianmeng/dotfiles.git $HOME/.cfg
```

Backup all your existing dotfiles, if any:
```bash
$ mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

Pull all dotfiles:
```bash
$ hgit checkout
```

Reload Bash and install all the necessary packages:
```bash
$ source ~/.bashrc
```

To manage these dot files, just use the `hgit` alias which is a wrapper to
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
