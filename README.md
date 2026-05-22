# There is no place like $HOME

A collection of configuration files for the typical console programs bash, vim,
screen, tmux, and misc.

Dotfiles management through Git following this [blog
post](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
and [HN post](https://news.ycombinator.com/item?id=11070797).

## Installation

Install essential console tools:

```bash
sudo apt install git tmux curl vim autojump apt-file inotify-tools aria2 \
ripgrep pgcli fswatch fzf hyperfine flatpak gcc automake autoconf gettext \
htop httpie nala bash-completion cargo lm-sensors xclip golang haskell-stack
pkg-config python-is-python3
```

Only if Rust and Cargo are available:

```bash
cargo install --locked hgrep typos-cli dua-cli typst-cli
```

Only if Go are available:

```bash
go install github.com/asdf-vm/asdf/cmd/asdf@v0.19.0
```

```bash
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
```

Install essential graphical tools:

```bash
sudo apt install gitk gedit chromium-chromedriver epiphany-browser \
chromium-browser gnome-shell-extensions \
gnome-browser-connector gnome-shell-extension-manager meld
```

Setup the alias:

```bash
alias hgit='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Clone the repository:

```bash
hgit clone --bare git@github.com:kianmeng/dotfiles.git $HOME/.cfg
```

Backup all your existing dotfiles, if any (not needed for fresh install):

```bash
mkdir -p .config-backup
hgit checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
```

Pull all dotfiles:

```bash
hgit checkout
```

Reload Bash and install all the necessary packages:

```bash
source ~/.bashrc
```

To manage these dot files, just use the `hgit` alias which is a wrapper to
`git`.

## Vim's Key Bindings

- `<space>`, leader key
- `jj`, exit from insert mode into normal mode
- `<space>p`, toggle between paste mode and normal mode

## Tmux's Key Bindings

- `<alt><space>`, prefix key alt + space
- `<alt>j`, switch to left tab
- `<alt>k`, switch to right tab
- `<alt>o`, create new tab
- `<shift>pgup`, scroll previous page
