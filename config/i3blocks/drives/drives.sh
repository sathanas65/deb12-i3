#!/bin/bash

# Collecting disk space data
data=$(df -h | awk '/\/dev\/mapper/ {print $1, $4}')

# Processing and formatting the output
formatted_output=$(echo "$data" | awk '
BEGIN {
    OFS = " | ";  # Setting output field separator
}
/dev\/mapper\/vg0-root/ {
    root = "/ " $2
}
/dev\/mapper\/vg1-home/ {
    home = "h " $2
}
/dev\/mapper\/vg1-var/ {
    var = "v " $2
}
END {
    print "💾 " root, home, var  # Printing the formatted output with icon
}')

# Outputting the final result
echo "$formatted_output"
