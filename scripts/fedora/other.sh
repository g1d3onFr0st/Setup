#!/usr/bin/env bash

# tldr
nix profile add nixpkgs\#tldr
tldr --update

echo "other.sh : DONE" >> ~/Setup/setup-status.txt