
# rpm
alias rpmqa='rpm -qa'
alias rpmqq='rpm -qa | grep'

# expanding the value of the rpm's built-in macros.
function rpm_macro() {
    if [[ -z "$1" ]]; then
        echo "No filename supplied"
    else
        cat $1 | awk '{print $1}' | grep ^% | xargs -I % sh -c 'echo -en "%\t"; rpm --eval %' | column -t 
    fi
}
