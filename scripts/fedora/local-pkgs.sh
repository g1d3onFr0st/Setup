#!/usr/bin/env bash

LOCAL_PKGS=(
    "docker"
    "docker-compose"
    "gh"
    "ghostty"
    "git"
    "localsend"
    "niri"
    "nix"
    "nix-daemon"
    "noctalia"
    "noctalia-greeter-compositor"
    "obs-studio"
    "pgcli"
    "postgresql-server"
    "satty"
    "xdg-desktop-portal"
    "xdg-desktop-portal-gtk"
    "xdg-desktop-portal-gnome"
    "zsh"
)
LOCAL_REPOS=(
    "scottames/ghostty"
)

sudo rm -rf /etc/dnf/dnf.conf
sudo cp ~/setup/config/dnf/dnf.conf /etc/dnf/


sudo dnf config-manager addrepo --id=mozilla --set=baseurl=https://packages.mozilla.org/rpm/firefox --set=gpgkey=https://packages.mozilla.org/rpm/firefox/signing-key.gpg --set=gpgcheck=1 --set=repo_gpgcheck=0 --set=priority=10 --set=includepkgs=firefox-devedition\*
sudo dnf makecache --refresh --repo mozilla


sudo dnf upgrade --refresh -y


sudo dnf copr enable -y "${LOCAL_REPOS[@]}"
sudo dnf install -y "${LOCAL_PKGS[@]}"
