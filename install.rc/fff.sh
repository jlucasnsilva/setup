#!/bin/bash

FFF_VER=2.2
FFF_DIR=fff-$FFF_VER

wget -qO- https://github.com/dylanaraps/fff/archive/$FFF_VER.tar.gz | tar -xzf -
cd $FFF_DIR
sudo make install
cd ..
rm -rf $FFF_DIR/
