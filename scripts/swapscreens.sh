#!/bin/bash

# Get workspace info from i3
workspaces=$(i3-msg -t get_workspaces)

# Extract the names and outputs of the current workspaces
workspace1=$(echo $workspaces | jq -r '.[] | select(.focused==true) | .name')
output1=$(echo $workspaces | jq -r '.[] | select(.focused==true) | .output')
workspace2=$(echo $workspaces | jq -r '.[] | select(.visible==true and .focused==false) | .name')
output2=$(echo $workspaces | jq -r '.[] | select(.visible==true and .focused==false) | .output')

# Check if two workspaces are found
if [ -z "$workspace1" ] || [ -z "$workspace2" ]; then
    echo "Could not find two active workspaces to swap."
    exit 1
fi

# Move workspace 1 to output 2
i3-msg workspace $workspace1
i3-msg move workspace to output $output2

# Move workspace 2 to output 1
i3-msg workspace $workspace2
i3-msg move workspace to output $output1
