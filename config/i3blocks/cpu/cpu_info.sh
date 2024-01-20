#!/bin/sh

# Fetch CPU temperature
TEMP=$(sensors | grep 'Package id 0:\|Tdie' | grep ':[ ]*+[0-9]*.[0-9]*°C' -o | grep '+[0-9]*.[0-9]*°C' -o)

# If no temperature data is found, set TEMP to '?°C'
if [ -z "$TEMP" ]; then
    TEMP='?°C'
fi

# Fetch CPU usage
CPU_USAGE=$(mpstat 1 1 | gawk '/Average:/ {printf("%s\n", $(NF-9))}')

# Output CPU usage and temperature
echo "$CPU_USAGE $TEMP" | gawk '{ printf(" CPU:%6s%% @ %s \n", $1, $2) }'
