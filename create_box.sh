VM_NAME=`VBoxManage list -l runningvms | grep Name: | tr -s " " " " | cut -d " " -f2`
vagrant package --base $VM_NAME --output boxes/swarm.box 
vagrant box add "docker-swarm/base" boxes/swarm.box
