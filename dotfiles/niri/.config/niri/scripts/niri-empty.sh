#!/bin/env sh

[ "$DESKTOP" = "1" ] || exit 0

exec ~/.config/niri/bins/niri-empty -c "noctalia msg bar-hide" -e "noctalia msg bar-show"
