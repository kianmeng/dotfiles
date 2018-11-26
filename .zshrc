# Settings based on https://mgdm.net/weblog/zsh-antigen/
ZSHA_BASE=$HOME/.zsh.d
source $ZSHA_BASE/antigen/antigen.zsh

antigen-use oh-my-zsh

antigen-bundle git
antigen bundle rupa/z
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search

antigen-theme bira

antigen-apply
