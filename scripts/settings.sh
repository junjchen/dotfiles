#!/usr/bin/env bash

if [ ! -d ~/repos/dotfiles ]; then
  git clone https://github.com/junjchen/dotfiles.git ~/repos/dotfiles
  ln -s ~/repos/dotfiles/config.fish ~/.config/fish/config.fish;
  ln -s ~/repos/dotfiles/.tmux.conf ~/.tmux.conf;
  ln -s ~/repos/dotfiles/.tool-lersions ~/.tool-versions;
fi
