#!/usr/bin/env bash

KDE_BLOAT=(
    "kontact" "skanpage" "akregator" "/usr/bin/contactprintthemeeditor" "/usr/bin/contactthemeeditor" "/usr/bin/kdeconnect-app"
    "/usr/bin/kdeconnect-sms" "/usr/bin/headerthemeeditor" "kmail" "/usr/bin/krdc" "krfb" "ktnef" "neochat" "dragon" "/usr/bin/elisa"
    "qrca" "korganizer" "kleopatra" "/usr/bin/akonadiimportwizard" "ktnef" "kaddressbook" "gnome-abrt" "plasma-welcome" "plasma-systemmonitor"
    "/usr/bin/drkonqi-coredump-gui" "/usr/bin/kjournaldbrowser" "xwaylandvideobridge" "kdebugsettings" "kfind" "kwalletmanager5" "kwrite" "kmouth"
)

sudo dnf remove -y "${KDE_BLOAT[@]}"

nix run nixpkgs\#konsave -- -i ~/Setup/config/kde-plasma/kde.knsv
nix run nixpkgs\#konsave -- -a kde

echo "kde-setup.sh : DONE" >> ~/Setup/setup-status.txt