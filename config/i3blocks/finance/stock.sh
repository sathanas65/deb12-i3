#!/bin/bash

# API endpoint and headers
API_URL="https://realstonks.p.rapidapi.com/{YOUR STOCK}"
API_KEY="{YOUR API KEY}"
API_HOST="realstonks.p.rapidapi.com"

# Making the API request
response=$(curl -s --request GET \
                 --url $API_URL \
                 --header "X-RapidAPI-Key: $API_KEY" \
                 --header "X-RapidAPI-Host: $API_HOST")

# Extracting and rounding the price
price=$(echo $response | jq -r '.price' | awk '{printf "%.0f\n", $1}')

# Output the price in the desired format
echo "{YOUR STOCK LABEL (arbitrary, I just use the ticker label)}=$price"
