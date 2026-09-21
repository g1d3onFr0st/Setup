#!/usr/bin/env bash

    NIX_PKGS=(
        "bat"
        "btop"
        "bun"
        "delta"
        "fastfetch"
        "fd"
        "firefox-devedition"
        "gcc"
        "neovim"
        "nodejs"
        "ripgrep"
        "vlc"
        "vscode"
        "yazi"
        "zellij"
    )

    NIXPKGS_ALLOW_UNFREE=1 \
    NIXPKGS_ALLOW_INSECURE=1 \
    nix profile add --impure "${NIX_PKGS[@]/#/nixpkgs#}"


echo "nix-pkgs.sh : DONE" >> ~/Setup/setup-status.txt