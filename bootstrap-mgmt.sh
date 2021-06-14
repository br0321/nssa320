#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# copy examples into /home/vagrant (from inside the mgmt node)
cp -a /vagrant/examples/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
10.0.15.10  controller
10.0.15.11  siege
10.0.15.12  haproxy
10.0.15.21  webserver1
10.0.15.22  webserver2
10.0.15.23  webserver3
10.0.15.24  webserver4
10.0.15.25  webserver5
10.0.15.26  webserver6
EOL
