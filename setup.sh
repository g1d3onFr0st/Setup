#!/usr/bin/env bash

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

   
   touch ~/Setup/setup-status.txt
   
   touch ~/Setup/dotfiles/environment.d/.config/environment.d/desktop.conf
   if [[ "$1" == "--usb" ]]; then
       echo "export DESKTOP=0" >> ~/Setup/dotfiles/environment.d/.config/environment.d/desktop.conf
   else
       echo "export DESKTOP=1" >> ~/Setup/dotfiles/environment.d/.config/environment.d/desktop.conf
   fi
   
   nix profile install nixpkgs\#stow
   ~/.nix-profile/bin/stow -t ~ -d ~/Setup/dotfiles --adopt $(ls ~/Setup/dotfiles)
   sudo "$HOME/.nix-profile/bin/stow" -t / -d ~/Setup/system-dotfiles --no-folding --adopt $(ls ~/Setup/system-dotfiles)

   sudo dnf install -y zsh
   nix profile add nixpkgs\#{zsh-autosuggestions,zsh-syntax-highlighting,zsh-history-substring-search,fzf,oh-my-posh,zoxide,eza}
   sudo chsh -s "$(command -v zsh)" "$USER"
   echo "shell.sh : DONE" >> ~/Setup/setup-status.txt

   echo "running cleanup"
   sudo dnf update -y && sudo dnf upgrade -y
   sudo dnf autoremove -y      
   sudo echo ""
   echo "setup is done , rebooting in "
   echo "3"
   sleep 1
   echo "2"
   sleep 1
   echo "1"
   sleep 1
   echo "final.sh : DONE" >> ~/Setup/setup-status.txt
   sudo systemctl reboot







    ;;
arch)

;;

*)

    echo -e "${C_RED}Unsupported OS ($DETECTED_OS). This script strictly supports Fedora.${RESET}"
    exit 1

    ;;

esac
