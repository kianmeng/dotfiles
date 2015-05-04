# similar to apt.sh, some aliases to reduce typing.

# general stuff
alias yumsh='sudo yum shell'
alias yumhist='sudo yum history'
alias yumu='sudo yum update'
alias yumcu='sudo yum check-update'
# this will generate the debug file and let us debug all yum-related variables
# @see http://unix.stackexchange.com/questions/19701/yum-how-can-i-view-variables-like-releasever-basearch-yum0
alias yumdd='sudo yum-debug-dump'

# common actions
# alias may conflict with YUMI (Your Universal Multibot Integrator) tool
alias yumi='sudo yum install -y'
alias yumri='sudo yum reinstall -y'
alias yumdown='sudo yum downgrade'
alias yumr='sudo yum remove'
alias yumif='sudo yum info'
# use which to provide the full path to the file
# see http://lukas.zapletalovi.com/2011/06/my-yum-aliases.html
alias yumfs='sudo yum provides $(which $1)'
# Use -C to use cache to prevent download of metadata
alias yums='sudo yum -C search all'

# group-related
alias yumgi='sudo yum groupinstall'
alias yumgr='sudo yum groupremove'
alias yumgu='sudo yum groupupdate'
alias yumgl='sudo yum grouplist'
alias yumgif='sudo yum groupinfo'

# repo-related
alias yumrepo='sudo yum repolist all'

# repoquery
# from yum-utils
alias repoql='repoquery -l'
alias repoqi='repoquery -i'
alias repoqf='repoquery -f'
alias repoqs='repoquery --search --cache'
