#!/bin/bash
echo "10.66.66.15:/home	/home	nfs4	soft,intr,bg	0 0" >> /etc/fstab

mount -t nfs 10.66.66.15:/home /home
