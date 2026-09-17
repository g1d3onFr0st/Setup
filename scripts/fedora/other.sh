#!/usr/bin/env bash

echo "updating TLDR"
tldr --update

echo "stowing all dotfiles"
~/.nix-profile/bin/stow -t ~ -d ~/setup/dotfiles --adopt *

echo "installing bun"
nix profile install nixpkgs\#bun

echo "install gemini cli
~/.nix-profile/bin/bun i -g @google/gemini-cli

echo "installing zed"
curl -f https://zed.dev/install.sh | sh
