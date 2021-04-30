#!/bin/bash
# set NIC
sudo ifconfig enp4s0f0:1 140.114.91.243 netmask 255.255.255.0 broadcast 140.114.91.255 up
sudo ifconfig enp4s0f0:2 10.66.66.15 netmask 255.255.255.0 broadcast 10.66.66.255 up

# set firewall
firewall-cmd --set-default-zone=external
firewall-cmd --permanent --zone=external --change-interface=enp4s0f0
firewall-cmd --permanent --zone=external --change-interface=enp4s0f0:0
firewall-cmd --permanent --zone=trusted --add-source=10.66.66.0/24
firewall-cmd --permanent --zone=trusted --add-source=192.168.66.0/24