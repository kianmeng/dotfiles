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

# setup and check for virtualenvwrapper.sh
# via http://virtualenvwrapper.readthedocs.org/en/latest/install.html
# via http://mkelsey.com/2013/04/30/how-i-setup-virtualenv-and-virtualenvwrapper-on-my-mac
WRAPPER_BIN=$(command -v virtualenvwrapper.sh)
if [ -n "$WRAPPER_BIN" ] 
then
    # location of our virtual environment
    export WORKON_HOME=$HOME/.virtualenvs

    # location of our project folder
    export PROJECT_HOME=$HOME/Projects

    # ensure all new environments are isolated from the site-packages directory
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

    # use the same directory for virtualenvs as virtualenvwrapper
    export PIP_VIRTUALENV_BASE=$WORKON_HOME

    # makes pip detect an active virtualenv and install to it
    export PIP_RESPECT_VIRTUALENV=true
    source $WRAPPER_BIN
else
    echo "Missing virtualenvwrapper.sh ! Please run : pip install virtualenvwrapper."
fi
