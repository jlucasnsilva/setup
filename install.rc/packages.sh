#!/bin/bash

sudo apt purge -y vim-tiny

cat install/packages-only.list | xargs sudo apt install -y --no-install-recommends --no-install-suggests
cat install/packages.list | xargs sudo apt install -y 

pulseaudio -D
