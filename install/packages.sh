#!/bin/bash

sudo apt install -y xinit lightdm --no-install-recommends --no-install-suggests

sudo apt purge -y vim-tiny

cat install/packages.list | xargs sudo apt install -y 
