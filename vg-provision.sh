#!/usr/bin/env bash
HOME="/home/vagrant"

sudo add-apt-repository ppa:aacebedo/fasd
sudo apt-get update
sudo apt-get -y install git curl silversearcher-ag fish fasd

sudo chsh -s /usr/bin/fish vagrant

mkdir -p "$HOME/repos"

if [ -d "$HOME/repos/dotfiles" ]; then rm -rf "$HOME/repos/dotfiles"; fi
git clone https://github.com/junjchen/dotfiles.git "$HOME/repos/dotfiles";

if [ ! -e "$HOME/.vimrc" ]; then
    ln -s "$HOME/repos/dotfiles/.vimrc" "$HOME/.vimrc";
fi

if [ ! -e "/tmp/install-omf" ]; then
    curl -L https://get.oh-my.fish > /tmp/install-omf
    fish /tmp/install-omf --noninteractive
fi

fish -c 'omf install fasd bobthefish https://github.com/jhillyerd/plugin-git'

