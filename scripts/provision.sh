#!/usr/bin/env bash

sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get update
sudo apt-get -y install make build-essential git curl fish fasd tmux neovim ripgrep

mkdir -p ~/repos

sudo chsh -s /usr/bin/fish vagrant
