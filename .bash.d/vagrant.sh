# Make sure VirtualBox remains the default provider as vagrant libvirt may
# overwrite the default.
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# boxes
alias vgba='vagrant box add'
alias vgbr='vagrant box remove'
alias vgbl='vagrant box list'
alias vgbu='vagrant box update'

# plugins
alias vgpi='vagrant plugin install'
alias vgpu='vagrant plugin update'
alias vgpr='vagrant plugin uninstall'
alias vgps='gem search -d'

# for an accurate list of plugins
# see http://vagrant-lists.github.io/
function vgpl() {
    echo -e "Installed plugins"
    vagrant plugin list

    echo -e "\nAvailable plugins"
    gem search ^vagrant-* | less
}

# common usage
alias vgin='vagrant init'
alias vgssh='vagrant ssh'
alias vgsshc='vagrant ssh-config'
alias vghalt='vagrant halt'
alias vgup='vagrant up'
alias vgrm='vagrant destroy'
alias vgstat='vagrant global-status'

# vagrant homedir
alias vgbox='cd $HOME/.vagrant.d/boxes'
alias vghome='cd $HOME/.vagrant.d'

# recompile the virtualbox kernel module upon kernel upgrade
alias vboxdrv='sudo /etc/init.d/vboxdrv setup'
