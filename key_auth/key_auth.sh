#!/bin/bash

IP_LIST="
15.83.246.27"

read -p "Please input password: " PASSWORD

rpm -q sshpass &> /dev/null

if [ $? -eq 0 ]; then
    echo "The sshpass has been installed."
else
    apt install -y sshpass &> /dev/null
    if [ $? -eq 0 ]; then
        echo "The sshpass install is complated."
    else
        echo "The sshpass install is failed."
    fi
fi

if [ -f /root/.ssh/id_rsa ]; then
    rm -rf /root/.ssh/id_rsa
    ssh-keygen -P "" -f ~/.ssh/id_rsa &> /dev/null
    echo "The key file has been create."
else
    ssh-keygen -P "" -f ~/.ssh/id_rsa &> /dev/null
    echo "The key file create is completed."
fi

for i in $IP_LIST; do
    sshpass -p $PASSWORD ssh-copy-id -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa.pub $i
    if [ $? -eq 0 ]; then
        echo "upload public key to $i is completed."
    else
        echo "upload public key to $i is failed."
    fi
done

