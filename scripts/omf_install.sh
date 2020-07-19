#!/usr/bin/env bash

if [ ! -d ~/.local/share/omf ]; then
  curl -sL https://get.oh-my.fish > /tmp/install-omf
  fish /tmp/install-omf --noninteractive
  fish -c 'omf install https://github.com/jhillyerd/plugin-git'
fi

