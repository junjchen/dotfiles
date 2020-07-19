#!/usr/bin/env bash

if [ ! -d ~/repos/dotfiles ]; then
  git clone https://github.com/junjchen/dotfiles.git ~/repos/dotfiles

  mkdir -p ~/.config/fish
  mkdir -p ~/.config/nvim

  ln -s ~/repos/dotfiles/config.fish ~/.config/fish/config.fish
  ln -s ~/repos/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
  ln -s ~/repos/dotfiles/init.vim ~/.config/nvim/init.vim

  ln -s ~/repos/dotfiles/.tmux.conf ~/.tmux.conf
  ln -s ~/repos/dotfiles/.tool-versions ~/.tool-versions
fi
