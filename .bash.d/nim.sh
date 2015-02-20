# Nim programming language related aliases and environment variables
# Installation steps from http://howistart.org/posts/nim/1

# Nim binary path
# See http://nim-lang.org/
#
# $ git clone https://github.com/Araq/Nim
# $ cd Nim
# $ git clone --depth 1 https://github.com/nim-lang/csources
# $ cd csources && sh build.sh
# $ cd ..
# $ bin/nim c koch
# $ ./koch boot -d:release
if [[ ! "$PATH" =~ "$HOME/Projects/Nim/bin" ]]; then
    export PATH=$PATH:$HOME/Projects/Nim/bin
fi

# Nimble binary path
# See https://github.com/nim-lang/nimble#readme
#
# $ git clone https://github.com/nim-lang/nimble
# $ cd nimble
# $ nim c -r src/nimble install
# $ nimble update
if [[ ! "$PATH" =~ "$HOME/.nimble/bin" ]]; then
    export PATH=$PATH:$HOME/.nimble/bin
fi

# c - compile, r - run, different verbosity.
alias nimc='nim c -r --verbosity:0'
alias nimcv='nim c -r --verbosity:1' # this is the default
alias nimcvv='nim c -r --verbosity:2' # this will show the line of source with issue
alias nimcvvv='nim c -r --verbosity:3'

# compile a release version which turn off checking and turn on optimization.
alias nimcr='alias nim c -d:release'
