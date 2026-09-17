#!/usr/bin/env sh

set -Eeuo pipefail
trap 'echo "Failed on line $LINENO"' ERR

# ==============================================================================
# Terminal UI Colors & Formatting
# ==============================================================================
RESET="\e[0m"
BOLD="\e[1m"
DIM="\e[2m"
C_BLUE="\e[34m"
C_CYAN="\e[36m"
C_GREEN="\e[32m"
C_YELLOW="\e[33m"
C_RED="\e[31m"
C_MAGENTA="\e[35m"

DETECTED_OS=$(awk -F= '/^ID=/{gsub(/"/, "", $2); print $2}' /etc/os-release)

case "$DETECTED_OS" in

fedora)

    echo "Fedora Linux detected , initiating setup ... "
    
    sudo dnf install -y git gh nix nix-daemon
    sudo systemctl enable --now nix-daemon
    
    gh auth login
    git clone https://github.com/g1d3onFr0st/Setup.git

    nix profile install nixpkgs\#stow
    ~/.nix-profile/bin/stow -t ~ -d ~/setup/dotfiles --adopt git 

    ;;

*)

    echo -e "${C_RED}Unsupported OS ($DETECTED_OS). This script strictly supports Fedora.${RESET}"
    exit 1

    ;;

esac
