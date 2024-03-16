#!/bin/bash

# API headers
API_KEY="<your API key here>"
SYMBOL="<your stock symbol here>"

# Alpha Vantage API endpoint for the GLOBAL_QUOTE function
API_URL="https://www.alphavantage.co/query"

# Make the API request and extract the stock price
response=$(curl -s "${API_URL}?function=GLOBAL_QUOTE&symbol=${SYMBOL}&apikey=${API_KEY}")
price=$(echo $response | jq -r '.["Global Quote"]["05. price"]')

# Check if the price is retrieved successfully
if [ -z "$price" ] || [ "$price" == "null" ]; then
  echo "Failed to retrieve the stock price for ${SYMBOL}"
  exit 1
fi

# Round the price to the nearest dollar
rounded_price=$(printf "%.0f" "$price")

# Output the stock price in the desired format
echo "${SYMBOL}=$rounded_price"

