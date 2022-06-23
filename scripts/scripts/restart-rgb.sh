#!/bin/sh

case $1/$2 in
  pre/*)
    ;;
  post/*)
    su -c '/home/mihranmashhud/scripts/openrgb_startup' mihranmashhud
    ;;
esac
