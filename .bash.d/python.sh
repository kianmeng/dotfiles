# autoload certain essential modules
# pip install pprint
# pip install awesome_print
# pip install ipython
#
# see http://docs.python.org/2/using/cmdline.html#envvar-PYTHONSTARTUP
#
export PYTHONSTARTUP=$HOME/.pythonstartup

# ipython default data path
# by default in my ubuntu 14.10, running ipython profile create will create the
# profile data in $HOME/.config/ipython which is not suitable to be version
# control into my dotfiles repository.
#
# see http://ipython.org/ipython-doc/dev/config/intro.html#profiles
# see http://ipython.org/ipython-doc/dev/interactive/tutorial.html#startup-files
#
export IPYTHONDIR=$HOME/.ipython

# remove all compiled python code recursively
alias rmpyc='find . -type f -name "*.pyc" -delete'

# alias for nose testing command line
alias nt='nosetests'
