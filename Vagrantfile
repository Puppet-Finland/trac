# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "trac" do |box|
    box.vm.box = "puppetlabs/ubuntu-16.04-64-puppet"
    box.vm.box_version = "1.0.0"
    box.vm.hostname = "trac.local"
    box.vm.network "private_network", ip: "192.168.18.100"
    box.vm.provision "shell" do |s|
      s.path = "vagrant/prepare.sh"
      s.args = "trac"
    end
    box.vm.provision "shell", inline: "puppet apply --modulepath /home/vagrant/modules /vagrant/vagrant/trac.pp"
    box.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = 1024
    end
  end
end