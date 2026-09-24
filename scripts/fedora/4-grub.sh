#!/usr/bin/env bash


sudo mkdir -p /boot/grub2/themes

git clone https://github.com/harishnkr/bsol ~/GRUBSETUPTEMPFOLDER/
git clone https://github.com/catppuccin/grub ~/GRUBSETUPTEMPFOLDER/
tar -xzf ~/Setup/config/grub/stylish.tar.gz -C ~/GRUBSETUPTEMPFOLDER/

sudo cp -r ~/GRUBSETUPTEMPFOLDER/bsol/bsol ~/GRUBSETUPTEMPFOLDER/grub/src/* ~/GRUBSETUPTEMPFOLDER/stylish /boot/grub2/themes/
rm -rf ~/GRUBSETUPTEMPFOLDER

sudo grub2-mkconfig -o /boot/grub2/grub.cfg

echo "grub.sh : DONE" >> ~/Setup/setup-status.txt