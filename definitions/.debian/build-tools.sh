#!/bin/bash

#build essential
apt-get install build-essential -y

#xml
apt-get install libxslt1.1 libxslt1-dev libxml2 -y

#readline
apt-get install libreadline5-dev -y

#yaml
apt-get install libyaml-dev -y

#ssl
apt-get install libssl-dev libopenssl-ruby libcurl4-openssl-dev -y

#libffi
apt-get install libffi-dev libffi-ruby -y

# also add sysv-rc-conf
apt-get install sysv-rc-conf

# add sbin to the path
echo 'PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin' >> /home/vagrant/.bashrc
