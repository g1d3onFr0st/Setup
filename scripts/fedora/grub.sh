#!/usr/bin/env bash


sudo mkdir -p /boot/grub2/themes

sudo dnf install -y git
git clone https://github.com/harishnkr/bsol ~/TEST/
git clone https://github.com/catppuccin/grub ~/TEST/
tar -xzf stylish.tar.gz -C ~/TEST/

sudo cp -r ~/TEST/bsol/bsol ~/TEST/grub/src/* ~/TEST/stylish /boot/grub2/themes/
rm -rf ~/TEST

sudo rm -rf /etc/default/grub
sudo cp ~/Setup/config/grub/grub /etc/default/
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
