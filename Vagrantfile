# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  
  ports = [8080]
  
  ports.each do |port|
	config.vm.network "forwarded_port", guest: port, host: port
  end
  
  # Hacky fix for Windows max path length issue.
  # See drmyersii's comment on https://github.com/npm/npm/issues/7228
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provider "virtualbox" do |v|
    v.customize ["sharedfolder", "add", :id, "--name", "vagrant", "--hostpath", (("//?/" + File.dirname(__FILE__)).gsub("/","\\"))]
  end

  config.vm.provision :shell, inline: "mkdir /vagrant"
  config.vm.provision :shell, inline: "mount -t vboxsf -o uid=`id -u vagrant`,gid=`getent group vagrant | cut -d: -f3` vagrant /vagrant", run: "always"
  # /hack
  
  config.vm.provision :shell, path: "bootstrap-puppet.sh"
  config.vm.provision :puppet,
  	:manifests_path => "./puppet/manifests",
	:module_path => "./puppet/modules", 
    :options => "--tags core,node"
end