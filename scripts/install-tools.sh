#!/bin/bash

sudo apt update -y

#################################
# Java
#################################

sudo apt install openjdk-21-jdk -y

#################################
# Jenkins
#################################

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install jenkins -y

#################################
# Docker
#################################

sudo apt install docker.io -y

sudo usermod -aG docker ubuntu

sudo usermod -aG docker jenkins

sudo systemctl restart jenkins

sudo systemctl enable docker

sudo systemctl start docker

#################################
# Git
#################################

sudo apt install git -y

#################################
# NodeJS
#################################

curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -

sudo apt install nodejs -y

#################################
# AWS CLI
#################################

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip

sudo apt install unzip -y

unzip awscliv2.zip

sudo ./aws/install

#################################
# kubectl
#################################

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x kubectl

sudo mv kubectl /usr/local/bin/

#################################
# eksctl
#################################

curl --silent --location \
"https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" \
| tar xz -C /tmp

sudo mv /tmp/eksctl /usr/local/bin

#################################
# Trivy
#################################

sudo apt install wget apt-transport-https gnupg lsb-release -y

wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/trivy.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | \
sudo tee /etc/apt/sources.list.d/trivy.list

sudo apt update

sudo apt install trivy -y

#################################
# Restart Jenkins
#################################

sudo systemctl enable jenkins

sudo systemctl restart jenkins