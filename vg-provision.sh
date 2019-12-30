#!/usr/bin/env bash
apt-get update
apt-get -y install git curl silversearcher-ag fish

chsh -s /usr/bin/fish

mkdir -p /home/vagrant/repos
git clone https://github.com/junjchen/dotfiles.git /home/vagrant/repos/dotfiles
ln -s /home/vagrant/repos/dotfiles/.vimrc /home/vagrant/.vimrc
