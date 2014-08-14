# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :forwarded_port, guest: 4567, host: 4567

  config.vm.synced_folder "..", "/vagrant"

  config.vm.provider :virtualbox do |v|
    v.customize [
      'modifyvm', :id,
      '--memory', '1024',
      '--cpuexecutioncap', '90',
      '--cpus', '2'
    ]
  end

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "chef/cookbooks"
    chef.roles_path = "chef/roles"
    chef.data_bags_path = "chef/data_bags"

    chef.add_role "development"
  end
end

