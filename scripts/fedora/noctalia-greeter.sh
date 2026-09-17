#!/usr/bin/env bash

echo "setting up noctalia greeter"
if rpm -q plasma-desktop >/dev/null 2>&1; then
 sudo systemctl disable plasmalogin
fi

if [[ command -v sddm >/dev/null 2>&1 ]]; then
 sudo systemctl disable sddm
fi

sudo systemctl enable noctalia-greeter-compositor
sudo rm -rf /etc/greetd/config.toml
sudo cp ~/setup/config/greetd/config.toml /etc/greetd/
