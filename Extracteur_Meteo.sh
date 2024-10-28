#!/bin/bash
CITY=${1:-"Toulouse"} 
DATE=$(date '+%Y-%m-%d - %H:%M')
METEO_DATA=$(curl -s "wttr.in/$CITY?format=%t+%T")
echo "$DATE - $CITY : $METEO_DATA" >> meteo.txt

