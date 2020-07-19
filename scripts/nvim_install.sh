#!/usr/bin/env bash

if [ ! -e  ~/.local/share/nvim/site/autoload/plug.vim ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
