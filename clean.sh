#!/usr/bin/bash

set -e

[[ -z "$STOW_PACKAGES" ]] && echo "$STOW_PACKAGES undefined! Aborting..." && exit 1

for package in "$STOW_PACKAGES"; do
  stow -vD $package
done
