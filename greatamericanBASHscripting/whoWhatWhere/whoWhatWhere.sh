#!/bin/bash

echo "Choose an action to perform:"
echo "1. nslookup"
echo "2. traceroute"
echo "3. curl"
echo "4. whois"

read -p "Enter the number of the action: " choice

read -p "Enter the IP address or web address: " address

read -p "Enter the file name to store the result: " filename

case $choice in
  1)
    nslookup $address > $filename
    ;;
  2)
    traceroute $address > $filename
    ;;
  3)
    curl -I $address > $filename
    ;;
  4)
    whois $address > $filename
    ;;
  *)
    echo "Invalid choice. Please select a number from 1 to 4."
    ;;
esac

echo "Result saved to $filename"
