#!/bin/env sh

[ "$DESKTOP" = "1" ] || exit 0

exec awww-daemon
