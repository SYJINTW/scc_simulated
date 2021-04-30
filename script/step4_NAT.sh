#!/bin/bash

# set firewall
systemctl enable firewalld
systemctl start firewalld
firewall-cmd --set-default-zone=external
firewall-cmd --permanent --zone=external --change-interface=enp4s0f0:2
firewall-cmd --permanent --zone=trusted --add-source=10.66.66.0/24
firewall-cmd --permanent --zone=trusted --add-source=192.168.66.0/24

# change config
sed -i "" 's/net.ipv4.ip_forward=0/net.ipv4.ip_forward=1/' /etc/sysctl.conf

# restart network
sysctl -p
systemctl restart network

# check ip setting
ifup enp4s0f0:2

# change config
sed -i "" 's/BOOTPROTO=".*"/BOOTPROTO="static"/' /etc/sysconfig/network-scripts/ifcfg-enp4s0f0:2

# restart network again
systemctl restart network