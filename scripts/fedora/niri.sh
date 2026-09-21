#!/usr/bin/env bash

sudo dnf install -y niri noctalia noctalia-greeter-compositor xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-gnome satty
nix profile add nixpkgs\#{hyprpicker,awww}

if rpm -q plasma-desktop >/dev/null 2>&1; then
 sudo systemctl disable plasmalogin
fi

if [[ command -v sddm >/dev/null 2>&1 ]]; then
 sudo systemctl disable sddm
fi

sudo systemctl enable noctalia-greeter-compositor

echo "niri.sh : DONE" >> ~/Setup/setup-status.txt