#!/usr/bin/env bash

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
