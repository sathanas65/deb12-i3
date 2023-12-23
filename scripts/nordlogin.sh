#!/bin/bash

# Run nordvpn login and capture the output
output=$(nordvpn login 2>&1) &
i3-msg mode "default"

# Extract the URL from the output
url=$(echo "$output" | grep -o 'https://[a-zA-Z0-9./?=_-]*')

# Check if the URL was found
if [ -n "$url" ]; then
    # Open the URL in Chromium
    chromium "$url" &> /dev/null &
else
    echo "Login URL not found."
fi
