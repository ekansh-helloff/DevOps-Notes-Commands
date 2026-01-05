#!/bin/bash
host="$1"
if [ -z "$host" ]; then
echo "Usage: $0 <hostname or IP>"
exit 1
fi
ping -c 4 "$host"

if [ $? -eq 0 ]; then
echo "$host is reachable."
else 
echo "$host is not reachable."
fi


# It uses the ping command with the -c 4 option to send four ICMP echo requests to the specified host.
# After the ping command runs, it checks the exit status ($?). If the exit status is 0, it means the host is reachable and the script prints a success message. Otherwise, it prints a failure message.