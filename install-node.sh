#!/bin/bash

nvm ls-remote | grep 'Latest LTS' | tail -n 1 | awk '{ print $1 }' | xargs nvm install

