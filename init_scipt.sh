#!/bin/bash

# Initial Node script
# Change path to node.conf for new node

# Configure NTP

apt-get install ntp ntpdate -y

cd /etc
# Download NTP.CONF
wget https://raw.githubusercontent.com/kibarg911/test_rep/master/ntp.conf.new
cp ntp.conf.new ntp.conf

# Restart service
systemctl restart ntp.service

# Date update
ntpdate -q 127.0.0.1

# Install TNT Node

# Installation script
curl -sSL https://cdn.rawgit.com/chainpoint/chainpoint-node/58a84a8822b8d79b1041c4fcf1d6e5d8e2fc431a/scripts/docker-install-ubuntu.sh | bash

# Download node configuration file
cd ~/chainpoint-node
wget https://raw.githubusercontent.com/kibarg911/test_rep/master/node_conf/node01.conf

cp node01.conf .env

# Start Node
make up

# Restart
shutdown -r now
