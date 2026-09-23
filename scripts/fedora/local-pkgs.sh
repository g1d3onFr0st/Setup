#!/usr/bin/env bash

LOCAL_REPOS=(
    "scottames/ghostty"
)

LOCAL_PKGS=(
    "caddy"
    "ghostty"
    "localsend"
    "nodejs"
    "npm"
)



# sudo dnf config-manager addrepo --id=mozilla --set=baseurl=https://packages.mozilla.org/rpm/firefox --set=gpgkey=https://packages.mozilla.org/rpm/firefox/signing-key.gpg --set=gpgcheck=1 --set=repo_gpgcheck=0 --set=priority=10 --set=includepkgs=firefox-devedition\*
# sudo dnf makecache --refresh --repo mozilla


sudo dnf makecache --refresh 

sudo dnf upgrade --refresh -y


sudo dnf copr enable -y "${LOCAL_REPOS[@]}"
sudo dnf install -y "${LOCAL_PKGS[@]}"

echo "local-pkgs.sh : DONE" >> ~/Setup/setup-status.txt