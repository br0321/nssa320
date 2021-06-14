# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # create mgmt node
  config.vm.define :controller do |mgmt_config|
      mgmt_config.vm.box = "ubuntu/trusty64"
      mgmt_config.vm.hostname = "controller"
      mgmt_config.vm.network :private_network, ip: "10.0.15.10"
      mgmt_config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
      end
      mgmt_config.vm.provision :shell, path: "bootstrap-mgmt.sh"
  end

  # create siege node
  config.vm.define :siege do |siege_config|
      siege_config.vm.box = "ubuntu/trusty64"
      siege_config.vm.hostname = "siege"
      siege_config.vm.network :private_network, ip: "10.0.15.11"
      siege_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
  end

  # create load balancer node
  config.vm.define :haproxy do |lb_config|
      lb_config.vm.box = "ubuntu/trusty64"
      lb_config.vm.hostname = "haproxy"
      lb_config.vm.network :private_network, ip: "10.0.15.12"
      lb_config.vm.network "forwarded_port", guest: 80, host: 8080
      lb_config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
      end
  end

  # create web server nodes
  (1..6).each do |i|
    config.vm.define "webserver#{i}" do |node|
        node.vm.box = "ubuntu/trusty64"
        node.vm.hostname = "webserver#{i}"
        node.vm.network :private_network, ip: "10.0.15.2#{i}"
        node.vm.network "forwarded_port", guest: 80, host: "808#{i}"
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "1024"
        end
    end
  end

end
