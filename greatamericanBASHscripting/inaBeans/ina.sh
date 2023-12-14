#!/bin/bash

# Read piped text
input=$(cat)

#Draw Ina
cat << "EOF"
 /\_/\  
( o.o ) 
 > ^ <
EOF

# Use grep to find IP addresses in the piped text
# Adjust the regex pattern to match your IP address format
ips=$(echo "$input" | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")

# Use awk to count and output occurrences of each IP address
echo "$ips" | awk '{ ipcount[$0]++ } END { for (ip in ipcount) { print "Ina has dug up the IP address: "  ip "     " ipcount[ip] " times." } }'

# Count occurrences of "80" and "443"
if [[ $1 == "-H" ]]; then
  count_80=$(echo "$input" | grep -oE "\b80\b" | wc -l)
  count_443=$(echo "$input" | grep -oE "\b443\b" | wc -l)

  echo "Ina thinks that Port 80 occurs $count_80 times"
  echo "Ina thinks that Port 443 occurs $count_443 times"
fi
