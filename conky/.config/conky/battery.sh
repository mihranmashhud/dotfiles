#!/usr/bin/sh
STATE=$(upower -i /org/freedesktop/UPower/devices/battery_$1 | grep "state" | cut -d" " -f20)
if [ "$STATE" == "fully-charged" ];then
   echo "Charged"
elif [ "$STATE" == "discharging" ];then
   echo "Discharging:" `upower -i /org/freedesktop/UPower/devices/battery_$1 | grep "percentage" | cut -d" " -f15-` ">"
elif [ "$STATE" == "charging" ];then
   echo "Charging:" `upower -i /org/freedesktop/UPower/devices/battery_$1 | grep "percentage" | cut -d" " -f15-`
else
   echo "Unknown State"
fi
