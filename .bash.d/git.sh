# see http://nuclearsquid.com/writings/git-tricks-tips-workflows/
# autocomplete for 'g' as well
alias g='git'
complete -o default -o nospace -F _git g

# for testing purposes
function git_dummy_commit() {
    for i in $(seq 1 $1);
    do
        touch $i; git add $i; git commit -m "$i"
    done
}

# step 1
# see http://stackoverflow.com/a/7929499
# origin/master branch to master branch (while in master branch)
function git_om2m() {
    git checkout master && git fetch origin && git rebase origin/master
}

# step 2
# see https://coderwall.com/p/9idt5g
# master branch to feature branch (while in feature branch)
function git_m2b() {
    git checkout master && git pull && git checkout - && git rebase master
}
