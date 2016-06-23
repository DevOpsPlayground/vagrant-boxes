Vagrant.configure("2") do |config|

  # Stop gatling rsync on startup
  config.gatling.rsync_on_startup = false if Vagrant.has_plugin?("vagrant-gatling-rsync")

  # Configure the swarm master
  config.vm.define "master" do |m|
    m.vm.box = "ubuntu/precise64"
    m.vm.box_check_update = false
    m.vm.hostname = "master"
    m.vm.synced_folder ".", "/vagrant"
    m.vm.provider :virtualbox do |vb|
      vb.memory = 512
      # On VirtualBox, we don't have guest additions or a functional vboxsf
      # in CoreOS, so tell Vagrant that to make it  smarter.
      vb.check_guest_additions = false
      vb.functional_vboxsf     = false
    end
    m.vm.provision :shell, inline: "chmod +x /vagrant/*.sh; /vagrant/install_docker.sh"
  end
end
