#!/bin/bash
adapter=$(ip a | grep wlp | cut -d ':' -f2 | head -n1 | awk '{print $1}')

[[ ! -d /sys/class/net/${adapter}/wireless ]] ||
    [[ "$(cat /sys/class/net/"$adapter"/operstate)" = 'down' ]] && exit

ssid=$(nmcli c show --active | tail -n1 | awk '{print $1}')
quality=$(tail -n1 < /proc/net/wireless | awk '{print $3}' | awk '{print $1*1}' | bc -l)

echo "$ssid $quality%"
echo "$ssid $quality%"

echo "#ffffff"
