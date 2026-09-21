#!/usr/bin/env bash

# Always start niri-zoomd
"$HOME/.config/niri/bins/niri-zoomd" &

# Only start desktop-specific applications when DESKTOP=1
if [[ "$DESKTOP" == "1" ]]; then
    awww-daemon &
    noctalia &

    "$HOME/.config/niri/scripts/noctalia-bar-toggle.sh" &
fi

# code &
# sleep 0.4
#
# firefox-devedition &
# sleep 0.4
#
# ghostty &
# sleep 1
#
# niri msg action move-column-left
# niri msg action move-column-left
# niri msg action focus-workspace Media

#
# ghostty --font-size=8 -e env -u ZELLIJ -u ZELLIJ_SESSION_NAME zellij --layout ~/.config/zellij/layouts/btop-shell.kdl &
# sleep 0.4
#
# ghostty --font-size=9 -e env -u ZELLIJ -u ZELLIJ_SESSION_NAME zellij --layout ~/.config/zellij/layouts/playerctltui-cava.kdl &
# sleep 0.4
#
# ghostty --font-size=7 -e pipes.sh &
# sleep 0.4
#
# ghostty --font-size=9 -e cmatrix &
# sleep 0.4
#
# ghostty --font-size=9 -e tty-clock -cs &
# sleep 1
#
# niri msg action focus-column-left
# niri msg action focus-column-left
# niri msg action focus-column-left
# niri msg action focus-column-left
#
# niri msg action consume-window-into-column
# niri msg action set-column-width 60%
# niri msg action focus-window-up
# niri msg action set-window-height 75%
# niri msg action focus-window-down
# niri msg action set-window-height 25%
#
# niri msg action focus-column-right
# niri msg action consume-window-into-column
# niri msg action consume-window-into-column
# niri msg action set-column-width 40%
#
# niri msg action focus-column-left
# niri msg action focus-window-down
#
# niri msg action focus-workspace Main
