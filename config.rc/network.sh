#!/bin/bash

# Sets NetworkManager as the default network manager for the wifi
sudo cp /etc/netplan/01-netcfg.yaml /etc/netplan/01-netcfg.yaml.bkp
sudo cp etc/01-netcfg.yaml /etc/netplan/01-netcfg.yaml
sudo netplan apply

# Forces NetworkManger to manage connections
sudo touch /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
sudo cp /etc/NetworkManager/NetworkManager.conf /etc/NetworkManager/NetworkManager.conf.bkp
sudo sed 's/managed=false/managed=true/g' -i /etc/NetworkManager/NetworkManager.conf
sudo systemctl restart NetworkManager
