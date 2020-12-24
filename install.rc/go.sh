#!/bin/bash

wget -qO- https://golang.org/dl/go1.15.6.linux-amd64.tar.gz | sudo tar -C /usr/local -xzf -

go get -u github.com/cosmtrek/air
go get -u github.com/spf13/cobra

git clone https://github.com/Stargarth/Goblocks.git
cd Goblocks
make install
cd ..
rm -rf Goblocks
