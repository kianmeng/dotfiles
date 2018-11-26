source $HOME/.zsh.d/zgen/zgen.zsh

ZSH_TMUX_AUTOSTART=true

# If the init script doesn't exist
if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/tmux

    # Generate the init script from plugins above.
    zgen save
fi
