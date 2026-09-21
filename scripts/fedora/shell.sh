#!/usr/bin/env bash

sudo dnf install -y zsh
nix profile add nixpkgs\#{zsh-autosuggestions,zsh-syntax-highlighting,zsh-history-substring-search,fzf,oh-my-posh,zoxide,eza}

sudo chsh -s "$(command -v zsh)" "$USER"

echo "shell.sh : DONE" >> ~/Setup/setup-status.txt
