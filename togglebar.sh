#!/bin/bash

CONFIG_FILE="$HOME/.config/i3/config"
TEMP_FILE="$(mktemp)"

# Check if the bar is currently commented out
if grep -q "^#bar {" "$CONFIG_FILE"; then
    # If commented out, uncomment it
    sed '/^#bar {/,/^#}/ s/^#//' "$CONFIG_FILE" > "$TEMP_FILE"
else
    # If not commented out, comment it
    sed '/^bar {/,/^}/ s/^/#/' "$CONFIG_FILE" > "$TEMP_FILE"
fi

# Move the temporary file to the original configuration file
mv "$TEMP_FILE" "$CONFIG_FILE"

# Reload i3 configuration
i3-msg reload
i3-msg restart
