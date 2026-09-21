#!/usr/bin/env bash

sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
nix run nixpkgs\#kubectl
sudo systemctl enable --now docker

sudo usermod -aG docker $USER
newgrp docker

echo "docker.sh : DONE" >> ~/Setup/setup-status.txt