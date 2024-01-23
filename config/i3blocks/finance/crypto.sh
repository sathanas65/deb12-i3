#!/bin/bash

# API endpoint for cryptocurrency prices
API_URL="https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,monero&vs_currencies=usd"

# Fetching the prices
response=$(curl -s $API_URL)

# Extracting prices in USD and rounding them
btc_price=$(echo $response | jq -r '.bitcoin.usd' | awk '{printf "%.0f\n", $1}')
eth_price=$(echo $response | jq -r '.ethereum.usd' | awk '{printf "%.0f\n", $1}')
xmr_price=$(echo $response | jq -r '.monero.usd' | awk '{printf "%.0f\n", $1}')

# Output the current prices
echo "BTC=$btc_price ETH=$eth_price XMR=$xmr_price"

