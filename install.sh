#!/bin/bash

sudo apt update

install/dotfiles.sh
install/packages.sh
install/suckless.sh
install/go.sh
install/vim.sh
install/nvm.sh
install/oh-my-fish.sh

sudo apt autoremove
