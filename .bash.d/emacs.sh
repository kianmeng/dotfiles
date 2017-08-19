# Some aliases to start Emacs differently

# start emacs in daemon mode
# @see https://news.ycombinator.com/item?id=10697849
function e
{
    emacsclient -t $@ || (emacs --daemon --no-site-lisp && emacsclient -t $@)
}
alias en='emacs -nw --no-site-lisp'
alias ec='emacs -nw'
alias ed='emacs -nw --debug-init'
alias ek='emacsclient -e "(kill-emacs)"'
