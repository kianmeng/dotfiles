source $HOME/.zsh.d/zgen/zgen.zsh

ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)
ZSH_TMUX_AUTOSTART=true

# If the init script doesn't exist
if ! zgen saved; then
    zgen oh-my-zsh

    zgen oh-my-zsh plugins/colored-man-pages
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/common-aliases
    zgen oh-my-zsh plugins/copyfile
    zgen oh-my-zsh plugins/cpanm
    zgen oh-my-zsh plugins/debian
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/docker-compose
    zgen oh-my-zsh plugins/dnf
    zgen oh-my-zsh plugins/extract
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/github
    zgen oh-my-zsh plugins/git-extras
    zgen oh-my-zsh plugins/gitignore
    zgen oh-my-zsh plugins/golang
    zgen oh-my-zsh plugins/history
    zgen oh-my-zsh plugins/httpie
    zgen oh-my-zsh plugins/mercurial
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/pass
    zgen oh-my-zsh plugins/perl
    zgen oh-my-zsh plugins/perms
    zgen oh-my-zsh plugins/rand-quote
    zgen oh-my-zsh plugins/rsync
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/systemd
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/vagrant
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/vscode
    zgen oh-my-zsh plugins/web-search
    zgen oh-my-zsh plugins/yarn
    zgen oh-my-zsh plugins/z

    zgen load chrissicool/zsh-256color
    zgen load desyncr/zsh-icdiff
    zgen load djui/alias-tips
    zgen load supercrabtree/k
    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-completions src

    zgen oh-my-zsh themes/bira

    # Generate the init script from plugins above.
    # If you add a new plugins/themes, zgen reset && source $HOME/.zshrc
    zgen save
fi
