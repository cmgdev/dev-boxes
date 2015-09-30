#!/usr/bin/env bash

apt-get update && apt-get install -y puppet

#There is a bug with Vagrant using Puppet 4. Revisit when that is resolved
#/usr/local/rvm/rubies/ruby-1.9.3-p551/bin/gem install puppet -V --no-ri --no-rdoc

PUPPET_MODULES="saz-timezone
garethr-docker
saz-sudo"

# Install the puppet modules if they are not already there
for module in $PUPPET_MODULES
do
    { puppet module list | grep $module > /dev/null; } || puppet module install $module     
done