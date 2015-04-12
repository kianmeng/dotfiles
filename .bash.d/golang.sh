# The GOPATH environment variable specifies the location of your workspace. It is
# likely the only environment variable you'll need to set when developing Go
# code.

# To get started, create a workspace directory and set GOPATH accordingly. Your
# workspace can be located wherever you like, but we'll use $HOME/go in this
# document. Note that this must not be the sameath as your Go installation.
# 
# http://golang.org/doc/code.html
export GOPATH=$HOME/$PROJECT/go
if [[ ! -d $GOPATH ]]; then
    mkdir -p $GOPATH
fi

if [[ ! "$PATH" =~ "$GOPATH" ]]; then
    export PATH=$PATH:$GOPATH/bin
fi

alias gofmt='gofmt -tabs=false -tabwidth=4 -w'
