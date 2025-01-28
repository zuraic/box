#!/bin/bash

# Check if a domain name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

# Get the IP address of the domain
ip_address=$(nslookup "$1" | grep 'Address:' | tail -n 1 | awk '{print $2}')

# Check if the IP address was found
if [ -z "$ip_address" ]; then
  echo "Could not find IP address for domain: $1"
  exit 1
fi

# Output the IP address
echo "The IP address of $1 is: $ip_address"