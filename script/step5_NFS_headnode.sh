#!/bin/bash
systemctl enable rpcbind
systemctl enable nfs
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap

systemctl start rpcbind
systemctl start nfs
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap
firewall-cmd --zone=external --permanent --add-service={rpc-bind,mountd,nfs}
firewall-cmd -–reload

echo "/home 10.66.66.0/24(rw,async,no_root_squash,no_all_squash)" >> /etc/exports

exportfs -ra

# Restart NFS
systemctl restart nfs
