#!/bin/bash

sudo apt update

install/packages.sh
install/suckless.sh
install/go.sh
install/vim.sh
install/oh-my-fish.sh

sudo apt autoremove
