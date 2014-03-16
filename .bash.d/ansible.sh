# no need to specify hosts file everytime we run the command
# see http://terraltech.com/configuring-and-managing-computers-with-ansible/
alias ansible_local='ansible -c local localhost'
alias ansible_local_ping='ansible_local -m ping'
