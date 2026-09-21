#!/usr/bin/env bash

# nix packages
NIX_PKGS=(
    "age"
    "cava"
    "chromium"
    "cloudflared"
    "cmtrix"
    "dbeaver-bin"
    "drawio"
    "duf"
    "github-desktop"
    "gitleaks"
    "just"
    "lazygit"
    "minio"
    "ncdu"
    "obsidian"
    "rmlint"
    "sops"
    "telegram-desktop"
    "tor-browser"
    "tty-clock"
)
NIXPKGS_ALLOW_UNFREE=1 \
NIXPKGS_ALLOW_INSECURE=1 \
nix profile add --impure "${NIX_PKGS[@]/#/nixpkgs#}"

    # NIX_FLAKES=(
    #     "git+https://github.com/youwen5/zen-browser-flake"
    # )

    # for flake in "${NIX_FLAKES[@]}"; do
    #     nix profile add "$flake"
    # done

# local packages
LOCAL_PKGS=(
    "obs-studio"
)

# LOCAL_REPOS=(

# )

sudo dnf makecache --refresh 

sudo dnf upgrade --refresh -y


# sudo dnf copr enable -y "${LOCAL_REPOS[@]}"
sudo dnf install -y "${LOCAL_PKGS[@]}"



# bun packages
nix profile install nixpkgs\#bun

~/.nix-profile/bin/bun i -g @google/gemini-cli

# install zed
curl -f https://zed.dev/install.sh | sh




echo "other-pkgs.sh : DONE" >> ~/Setup/setup-status.txt