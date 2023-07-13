#!/bin/bash
sudo apt-get update -y &&
sudo apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
unzip \
software-properties-common \
pip &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" &&
sudo apt-get update -y &&
sudo sudo apt-get install docker-ce docker-ce-cli containerd.io -y &&
sudo usermod -aG docker ubuntu
wget https://releases.hashicorp.com/terraform/1.5.3/terraform_1.5.3_linux_amd64.zip
unzip terraform_1.5.3_linux_amd64.zip && rm -rf terraform_1.5.3_linux_amd64.zip
sudo mv terraform /usr/bin/
touch ~/.bashrc
terraform -install-autocomplete
sudo pip install ansible