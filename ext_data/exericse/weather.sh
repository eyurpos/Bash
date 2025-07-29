#!/usr/bin/env bash

# https://www.weatherapi.com/

read -p "Enter city: " city

if ! [[ "$city" =~ ^[a-zA-Z]+$ ]]; then
    echo "Wrong city name."
    exit 1
fi

response=$(curl -sG 'https://api.weatherapi.com/v1/current.json' \
  --data-urlencode "key=2e34858e20ce4660859140046252907" \
  --data-urlencode "q=$city" \
  --data-urlencode "aqi=no")

if [ "$(echo "$response" | jq -r '.location.name')" = "null" ]; then
  echo "Something goes wrong."
  exit 2
fi

echo "$response" | jq -r '
"\(.location.name), \(.location.country)
Temp (C): \(.current.temp_c)
Humidity: \(.current.humidity)%
\(.current.condition.text)"
'