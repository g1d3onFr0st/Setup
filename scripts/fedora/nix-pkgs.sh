#!/usr/bin/env bash

    NIX_PKGS=(
        "age"
        "awww"
        "bat"
        "btop"
        "bun"
        "chromium"
        "cliphist"
        "cloudflared"
        "cmtrix"
        "dbeaver-bin"
        "delta"
        "drawio"
        "duf"
        "eza"
        "fastfetch"
        "fd"
        "firefox-devedition"
        "fzf"
        "gcc"
        "github-desktop"
        "gitleaks"
        "hyprpicker"
        "just"
        "lazygit"
        "minio"
        "ncdu"
        "neovim"
        "nodejs"
        "obsidian"
        "oh-my-posh"
        "ripgrep"
        "rmlint"
        "sops"
        "stow"
        "tealdeer"
        "telegram-desktop"
        "tor-browser"
        "tty-clock"
        "vlc"
        "vscode"
        "yazi"
        "zellij"
        "zoxide"
        "zsh-autosuggestion"
        "zsh-history-substring"
        "zsh-syntax-highlighting"
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
