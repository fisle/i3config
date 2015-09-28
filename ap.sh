#!/bin/bash
adapter=$(ip a | grep wlp | cut -d ':' -f2 | head -n1)

[[ ! -d /sys/class/net/${adapter}/wireless ]] ||
    [[ "$(cat /sys/class/net/$adapter/operstate)" = 'down' ]] && exit

ssid=$(iwconfig $adapter | awk -F\" '{print $2}' | head -n1)
quality=$(iwconfig $adapter | awk -F= '/Quality/ {print $2}' | awk '{print $1*1}' | bc -l)

echo "$ssid $quality%"
echo "$ssid $quality%"

if [[ $quality -ge 80 ]]; then
    echo "#00ff00"
elif [[ $QUALITY -lt 80 ]]; then
    echo "#FFF600"
elif [[ $QUALITY -lt 60 ]]; then
    echo "#FFAE00"
elif [[ $QUALITY -lt 40 ]]; then
    echo "#FF0000"
fi
