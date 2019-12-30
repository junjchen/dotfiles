#!/usr/bin/env bash
sudo add-apt-repository ppa:aacebedo/fasd
sudo apt-get update
sudo apt-get -y install git curl silversearcher-ag fish fasd

sudo chsh -s /usr/bin/fish

mkdir -p "$HOME/repos"

git clone https://github.com/junjchen/dotfiles.git "$HOME/repos/dotfiles";

ln -s "$HOME/repos/dotfiles/.vimrc" "$HOME/.vimrc";

ln -s "$HOME/repos/dotfiles/config.fish" "$HOME/.config/fish/config.fish";

curl -L https://get.oh-my.fish > /tmp/install-omf

fish /tmp/install-omf --noninteractive

fish -c 'omf install fasd bobthefish https://github.com/jhillyerd/plugin-git'

