#!/usr/bin/env bash

if [ ! -d ~/.asdf/plugins/nodejs ]; then
  fish -c 'asdf plugin add nodejs'
  bash -c '~/.asdf/plugins/nodejs/bin/import-release-team-keyring'
  fish -c 'asdf install'
fi
