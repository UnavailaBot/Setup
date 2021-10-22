#!/bin/bash

# Environment Setup
echo "### Setting Up ###"
sudo apt     update   -y
sudo apt     upgrade  -y
sudo apt-get update   -y
sudo apt-get upgrade  -y

sudo apt-get install -y build-essential
sudo apt-get install -y bluez
sudo apt-get install -y libboost-all-dev
sudo apt-get install -y libbluetooth-dev

sudo apt-get install -y python3.6
sudo apt     install -y bluetooth pi-bluetooth bluez blueman
sudo apt     install -y python3-pip

sudo python3 -m pip install --upgrade pip

pip3 install pip --upgrade
pip3 install --upgrade pip setuptools
python3      -m pip install warble
sudo python3 -m install warble
python3      -m pip install metawear
sudo python3 -m pip install metawear

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

sudo apt autoremove -y
sudo apt autoclean  -y

ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< y

read -p "GitHub Access Token: " token
echo $token > ~/.token
read -p "Production Env or Testing Env (prod/test): " env
read -p "Device Label (0, 1, 2 ...): " label
sudo hostnamectl set-hostname --static "${env}-pi-${label}"
gh auto login --with-token < ~/.token
gh ssh-key add ~/.ssh/id_rsa.pub --title "${env}-pi-${label}"

echo "### All Done! ###"
