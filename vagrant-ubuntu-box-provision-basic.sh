#!/usr/bin/env bash
sudo apt-get update
sudo apt-get -y install git curl

mkdir -p /home/vagrant/repos
git clone https://github.com/junjchen/dotfiles.git /home/vagrant/repos/dotfiles
ln -s /home/vagrant/repos/dotfiles/.vimrc /home/vagrant/.vimrc
