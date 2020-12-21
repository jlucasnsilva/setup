#!/bin/bash

sudo apt update

install/package.sh
install/suckless.sh
install/go.sh
install/vim.sh

sudo apt autoremove
