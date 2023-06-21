#!/bin/bash
# Update the package list
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt update
yes '' | sudo apt install docker.io
docker --version
sudo groupadd docker
sudo usermod -a -G docker  $USER
sudo chmod 666 /var/run/docker.sock
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -a -G docker  $USER
sudo chmod 666 /var/run/docker.sock
yes '' | sudo apt-get install -y awscli
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
sudo apt-get install -y apt-transport-https ca-certificates curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" >> ~/kubernetes.list
sudo mv ~/kubernetes.list /etc/apt/sources.list.d
sudo apt update
sudo usermod -a -G docker  $USER
sudo chmod 666 /var/run/docker.sock
yes '' | sudo apt-get install kubeadm kubelet kubectl
sudo chmod 666 /var/run/docker.sock
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 025946944436.dkr.ecr.ap-south-1.amazonaws.com/koko
docker container ls
docker run -it -p 5000:5000 -d 025946944436.dkr.ecr.ap-south-1.amazonaws.com/koko:latest
docker container ls
