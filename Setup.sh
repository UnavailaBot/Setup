#!/bin/bash

# Environment Setup
echo "### Setting Up ###"
sudo apt     update   -y
sudo apt     upgrade  -y
sudo apt-get update   -y
sudo apt-get upgrade  -y

sudo apt-get install build-essential  -y
sudo apt-get install bluez            -y
sudo apt-get install libboost-all-dev -y
sudo apt-get install libbluetooth-dev -y

sudo apt-get install python3.6                            -y
sudo apt     install bluetooth pi-bluetooth bluez blueman -y
sudo apt     install python3-pip                          -y

sudo python3 -m pip install --upgrade pip

pip3 install pip --upgrade
pip3 install --upgrade pip setuptools
python3      -m pip install warble
sudo python3 -m install warble
python3      -m pip install metawear
sudo python3 -m pip install metawear
python3      -m pip install --upgrade google-api-python-client google-auth-httplib2 google-auth-oauthlib
python3      -m pip install --upgrade google-api-python-client google-auth-httplib2 google-auth-oauthlib
pip install --upgrade google-api-python-client google-auth-httplib2 google-auth-oauthlib

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

sudo apt autoremove -y
sudo apt autoclean  -y

ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< y

bluetooth_mac_addr=`hcitool dev | grep -o "[[:xdigit:]:]\{11,17\}"`

gh auth login --with-token < ~/.github-token
gh ssh-key add ~/.ssh/id_rsa.pub --title $bluetooth_mac_addr

echo "### Setup Finished ###"

echo "### Downloading Code Base ###"

git clone git@github.com:UnavailaBot/Base.git ~/Project/Base

echo "### All Done! ###"
