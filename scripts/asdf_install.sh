#!/usr/bin/env bash

if [ ! -d ~/.asdf ]; then 
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8
fi

if [ ! -e ~/.config/fish/completions/asdf.fish ]; then
  mkdir -p ~/.config/fish/completions
  cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
fi
