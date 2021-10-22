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

pip3 install pip --upgrade
pip3 install --upgrade pip setuptools
python3      -m pip install warble
sudo python3 -m install warble
python3      -m pip install metawear
sudo python3 -m pip install metawear

sudo apt autoremove -y
sudo apt autoclean  -y

ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< y
echo "### Add Below SSH Key to GitHub ###"
cat ~/.ssh/id_rsa.pub
echo "### Add Above SSH Key to GitHub ###"
echo "### All Done! ###"
