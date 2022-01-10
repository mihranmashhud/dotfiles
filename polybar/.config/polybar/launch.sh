#!/bin/bash

killall -q polybar

export WIFI=`nmcli device | grep wifi | cut -d" " -f1`
export ETHERNET=`nmcli device | grep ethernet | cut -d" " -f1`
polybar mydesktopbar1 2>&1 | tee -a /tmp/polybar1.log & disown
polybar mydesktopbar2 2>&1 | tee -a /tmp/polybar2.log & disown
MONITOR="DisplayPort-0" polybar systray --reload 2>&1 &
ln -fs /tmp/polybar_mqueue.$TRAY_PID /tmp/ipc-systray

until ~/scripts/toggle-systray
do
  sleep 0.2
done

echo "Bars launched"
