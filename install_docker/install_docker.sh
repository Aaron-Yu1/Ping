#/bin/bash

# Check docker-ce
dpkg -s docker-ce &> /dev/null

if [ $? -eq 0 ]; then
    echo "Docker has been install."
    exit
else
    echo "Start install docker."
fi

# Install requirement
apt install -y apt-transport-https ca-certificates curl software-properties-common &> /dev/null

if [ $? -eq 0 ]; then
    echo "The requirement insatll is complated."
else
    echo "The requirement is install is failed."
    exit
fi

# Add docker package key
curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg |  apt-key add - &> /dev/null

if [ $? -eq 0 ]; then
    echo "The key is added."
else
    echo "Add the key is failed."
    exit
fi

# Change source
add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable" &> /dev/null

if [ $? -eq 0 ]; then
    echo "The source is added."
else
    echo "Add the source is failed."
    exit
fi

apt update &> /dev/null

# Install docker-ce
apt install -y docker-ce &> /dev/null

systemctl status docker.service &> /dev/null

if [ $? -eq 0 ]; then
    echo "Docker is installed."
else
    echo "The Docker isntall is failed."
    exit
fi
