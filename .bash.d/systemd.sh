# systemd related aliases

# systemd-analyze
alias sdab='systemd-analyze blame'
alias sdad='systemd-analyze dump'
alias sdat='systemd-analyze time'
alias sdav='systemd-analyze verify'
alias sdap='systemd-analyze plot > systemd-analyze-plot.svg'
alias sdacc='systemd-analyze critical-chain'
alias sdadot='systemd-analyze dot --user --order | dot -Tsvg > systemd-user.svg'
