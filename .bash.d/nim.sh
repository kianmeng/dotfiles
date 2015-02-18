# Nim programming language related aliases. 

# c - compile, r - run, different verbosity.
alias nimc='nim c -r --verbosity:0'
alias nimcv='nim c -r --verbosity:1'
alias nimcvv='nim c -r --verbosity:2'
alias nimcvvv='nim c -r --verbosity:3'

# compile a release version which turn off checking and turn on optimization.
alias nimcr='alias nim c -d:release'
