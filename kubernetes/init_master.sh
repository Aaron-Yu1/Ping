#!/bin/bash

kubeadm config print init-defaults > kubeadm.yaml

sed -i 's/.*advert.*/  advertiseAddress: 10.0.0.99/g' kubeadm.yaml

sed -i 's/.*name.*/  name: master/g' kubeadm.yaml

sed -i 's/imageRepo.*/imageRepository: registry.cn-hangzhou.aliyuncs.com\/google_containers/g' kubeadm.yaml

sed -i 's/  criSocket.*/  criSocket: unix:\/\/\/run\/cri-dockerd.sock/' kubeadm.yaml

kubeadm init --config kubeadm.yaml