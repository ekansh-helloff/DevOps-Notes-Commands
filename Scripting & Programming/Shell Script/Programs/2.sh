# echo "Enter filename"
# read filename

# if [ -e $filename ]
# then
# echo "$filename is exits on the directory"
# cat $filename

# else

#!/usr/bin/env bash
printf "Enter filename: "
read -r filename
P=$(pwd)

if [ -e "$filename" ]; then
  echo "\"$filename\" exists in the $P directory."
  cat "$filename"
else
  # create an empty file (non-interactive)
  : > "$filename"
  echo "File created: $filename"
fi