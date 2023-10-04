#/bin/bash

apt install -y nfs-server

mkdir /share

chmod -R 777 /share

echo "/share    *(rw,no_root_squash)" >> /etc/exports

systemctl restart nfs-server
