alias hglog="hg log --template '- {desc}\n' --date `date +%Y-%m-%d` > `date +%Y-%m-%d`.log"
alias hglogall="hg log --template '- {desc}\n' > hglog.log"
