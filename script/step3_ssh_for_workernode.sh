#!/bin/bash

# set firewall
systemctl stop firewalld
systemctl disable firewalld

# close SELinux
sudo setenforce 0

# change config file
sed -i "" 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
sed -i "" 's/SELINUX=permissive/SELINUX=disabled/' /etc/selinux/config
