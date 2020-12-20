#!/bin/bash

sudo apt install xinit lightdm --no-install-recommends --no-install-suggests

sudo apt purge -y vim-tiny

cat install/packages.list | xargs sudo apt install -y 
