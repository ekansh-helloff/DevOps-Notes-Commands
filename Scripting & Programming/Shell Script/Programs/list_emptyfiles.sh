#!/bin/bash
directory="$1"
if [ -z "$directory" ]; then
echo "Usage: $0 <directory>"
exit 1
fi

if [ ! -d "$directory" ]; then
echo "Error: '$directory' is not a valid directory."
exit 1
fi

echo "Empty files in $directory:"
find "$directory" -type f -empty


'find "$directory" -type f -empty': This line uses the `find` command to search for
 empty files ('-empty') of type regular files
 ('-type f') in the specified directory. It then lists these empty files.