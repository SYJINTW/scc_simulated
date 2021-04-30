#!/bin/bash

# change config
sed -i "" 's/#Port 22/Port 22/' /etc/sysconfig/network-scripts/ifcfg-enp4s0f0:1
sed -i "" 's/#PermitRootLogin no/PermitRootLogin yes/' /etc/sysconfig/network-scripts/ifcfg-enp4s0f0:1

# set firewall
sudo systemctl restart sshd.service
sudo systemctl enable sshd.service
sudo firewall-cmd --permanent --zone=public --add-port=22/tcp
sudo firewall-cmd --reload