#!/bin/bash

sudo apt purge -y vim-tiny

cat install.rc/packages-only.list | xargs sudo apt install -y --no-install-recommends --no-install-suggests
cat install.rc/packages.list | xargs sudo apt install -y 

