#!/usr/bin/env bash
sudo add-apt-repository ppa:aacebedo/fasd
sudo apt-get update
sudo apt-get -y install git curl silversearcher-ag fish fasd tmux
sudo chsh -s /usr/bin/fish vagrant

mkdir -p "$HOME/repos"
git clone https://github.com/junjchen/dotfiles.git "$HOME/repos/dotfiles";
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6;
mkdir -p ~/.config/fish/completions
cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions


ln -s "$HOME/repos/dotfiles/.vimrc" "$HOME/.vimrc";
ln -s "$HOME/repos/dotfiles/config.fish" "$HOME/.config/fish/config.fish";
ln -s "$HOME/repos/dotfiles/.tmux.conf" "$HOME/.tmux.conf";

curl -L https://get.oh-my.fish > /tmp/install-omf

fish /tmp/install-omf --noninteractive
fish -c 'omf install fasd agnoster https://github.com/jhillyerd/plugin-git'
