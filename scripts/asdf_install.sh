#!/usr/bin/env bash

if [ ! -d ~/.asdf ]; then 
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8
  mkdir -p ~/.config/fish/completions
  cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
fi
