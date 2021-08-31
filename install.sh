#!/usr/bin/bash

set -e

[[ -z "$STOW_PACKAGES" ]] && echo "\$STOW_PACKAGES undefined! aborting..." && exit 1

git pull # Make sure we are up to date

for package in "$STOW_PACKAGES"; do
  stow -v $package
done
