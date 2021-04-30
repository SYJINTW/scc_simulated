#!/bin/bash

# Install package
yum install yp-tools ypbind ypserv rpcbind

# Add lines to network config
# Set NIS domain name
echo "NISDOMAIN=nisdomain" >> /etc/sysconfig/network
# Set NIS as the static port
echo 'YPSERV_ARGS="-p 1011"' >> /etc/sysconfig/network

nisdomainname nisdomain

echo "dns: no" >> /etc/ypserv.conf
echo "files: 30" >> /etc/ypserv.conf
echo "xfr_check_port: yes" >> /etc/ypserv.conf
echo "*                         : * : * : none" >> /etc/ypserv.conf

echo "10.66.66.15 headnode" >> /etc/hosts
echo "10.66.66.16 workernode" >> /etc/hosts

sed -i "" 's/.*YPPASSWDD_ARGS=.*/YPPASSWDD_ARGS="--port  1012"/' /etc/sysconfig/yppasswdd

systemctl start ypserv yppasswdd
systemctl enable ypserv yppasswdd

useradd -u 1001 group3
passwd group3

sudo visudo

sudo echo "root    ALL=(ALL)       ALL" >> /etc/sudoers.tmp
sudo echo "group3  ALL=(ALL)       ALL" >> /etc/sudoers.tmp

