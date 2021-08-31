#!/usr/bin/sh

echo_connection() {
if [[ `nmcli -t device show wlp3s0 | grep "GENERAL.STATE"` == *'connected'* ]];then
  echo "Wireless - `nmcli -t device show wlp3s0 | grep "GENERAL.CONNECTION" | cut -d":" -f2-`"
  return
fi
if [[ `nmcli -t device show enp0s25 | grep "GENERAL.STATE"` == *"(connected)"* ]];then
  echo "Wired - `nmcli -t device show enp0s25 | grep "GENERAL.CONNECTION" | cut -d":" -f2-`"
  return
fi

echo "Disconnected"
}
echo_connection
