# similar to apt.sh, some aliases to reduce typing.

# general stuff
alias yumsh='sudo yum shell'
alias yumhist='sudo yum history'
alias yumu='sudo yum update'
alias yumcu='sudo yum check-update'

# common actions
# alias may conflict with YUMI (Your Universal Multibot Integrator) tool
alias yumi='sudo yum install'
alias yumri='sudo yum reinstall'
alias yumdown='sudo yum downgrade'
alias yumr='sudo yum remove'
alias yums='sudo yum search all'
alias yumif='sudo yum info'
alias yumfs='sudo yum provides'

# group-related
alias yumgi='sudo yum groupinstall'
alias yumgr='sudo yum groupremove'
alias yumgu='sudo yum groupupdate'
alias yumgl='sudo yum grouplist'

# repo-related
alias yumrepo='sudo yum repolist all'

# dnf
alias dnfi='sudo dnf install'
alias dnfu='sudo dnf update'
alias dnfri='sudo dnf reinstall'
alias dnfr='sudo dnf erase'
alias dnfif='sudo dnf info'
alias dnfs='sudo dnf search'
alias dnffs='sudo dnf provides'
