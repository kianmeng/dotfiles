# autoload certain essential modules
# pip install pprint
# pip install awesome_print
# pip install ipython
#
# http://docs.python.org/2/using/cmdline.html#envvar-PYTHONSTARTUP
# see
export PYTHONSTARTUP=$HOME/.pythonstartup

# remove all compiled python code recursively
alias rmpyc='find . -type f -name "*.pyc" -delete'

# alias for nose testing command line
alias nt='nosetests'
