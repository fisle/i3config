#!/bin/bash
IP=$(curl --silent http://afk.fisle.eu/ip.php)

case $BLOCK_BUTTON in
    3) echo -n "$IP" | xclip -q -se c ;;
esac

echo $IP # full text
echo $IP # short text
