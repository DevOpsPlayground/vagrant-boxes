# Install initial certificates
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Setup the extra libraries 
sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-precise experimental" > /etc/apt/sources.list.d/docker.list'
sudo apt-get update
sudo apt-get purge lxc-docker
apt-cache policy docker-engine
sudo apt-get --assume-yes install linux-image-extra-$(uname -r)
sudo apt-get update
sudo apt-get --assume-yes install linux-image-generic-lts-trusty
sudo apt-get --assume-yes install apparmor

# Install the latest docker version
sudo apt-get update
sudo apt-get --assume-yes install docker-engine=1.12.0~rc2-0~precise

# Clean up the cache etc to save space and make the box smaller
sudo apt-get clean
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY

# Reset the autohrized keys file to default
wget https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -O ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chown -R vagrant:vagrant ~/.ssh