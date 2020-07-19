#!/usr/bin/env bash

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# ripgrep
sudo add-apt-repository ppa:x4121/ripgrep

# neovim
sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt-get update
sudo apt-get -y install make build-essential git curl fish fasd tmux neovim ripgrep yarn

mkdir -p ~/repos

sudo chsh -s /usr/bin/fish vagrant
