#!/usr/bin/env bash

sudo dnf install -y zsh
nix profile add nixpkgs\#{zsh-autosuggestions,zsh-syntax-highlighting,zsh-history-substring-search,fzf,oh-my-posh,zoxide,eza,gh}
~/.nix-profile/bin/stow -t ~ -d ~/setup/dotfiles --adopt zsh 

sudo chsh -s "$(command -v zsh)" "$USER"