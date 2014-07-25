#!/bin/bash
IP=$(curl --silent http://myexternalip.com/raw)
CITY=$(curl --silent -D - http://freegeoip.net/csv/$IP)
CITY=$(echo $CITY | cut -f 7 -d , | cut -d '"' -f 2)
WEATHER=$(curl --silent http://api.openweathermap.org/data/2.5/weather?q=$CITY)
FAHRENHEIT=$(echo $WEATHER | grep -Po '"temp":.*?[^\\]",'| cut -d , -f 1 | cut -d : -f 2)
TEMP=$(echo "$FAHRENHEIT - 273" | bc -l | cut -d . -f 1)
WEATHER=$(echo $WEATHER | grep -Po '"weather":.*?[^\\]",'| cut -d : -f 4 | cut -d '"' -f 2)
echo $CITY: $TEMP°C $WEATHER
