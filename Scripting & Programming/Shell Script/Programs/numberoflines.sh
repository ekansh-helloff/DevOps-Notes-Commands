#!/bin/bash
file="/home/jayeshkumar/jayesh.txt"
# Check if the file exists
if [ -e "$file" ]; then
while IFS= read -r line; do
echo "Line read: $line"
# Add your processing logic here
done < "$file"
else
echo "File not found: $file"
fi