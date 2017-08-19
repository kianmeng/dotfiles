# autocomplete for 'g' as well
# see http://nuclearsquid.com/writings/git-tricks-tips-workflows/
alias g='git'
complete -o default -o nospace -F _git g

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# create sample dummuy commit for testing purposes
function git_dummy_commit() {
    for i in $(seq 1 $1);
    do
        touch $i; git add $i; git commit -m "$i"
    done
}

# git rebasing

# step 1
# origin/master branch to master branch (while in master branch)
#
# see http://stackoverflow.com/a/7929499
#
function git_om2m() {
    git checkout master && git fetch origin && git rebase origin/master
}

# step 2
# master branch to feature branch (while in feature branch)
#
# you may need to git pull --base from origin/feature_branch in case there is a
# divergence
#
# see https://coderwall.com/p/9idt5g
#
function git_m2b() {
    git checkout master && git pull && git checkout - && git rebase master
}

# show branch name in your bash prompt
#
# see http://www.oliverdavies.co.uk/blog/2013/04/display-git-branch-or-tag-names-your-bash-prompt
#
function parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}
