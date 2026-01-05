#!/bin/bash

my_function() {
echo "Hello World from GeeksforGeeks"
if [ -n "$1" ]; then
echo "You passed the argument: $1, $2"
else 
echo "No argument was passed."
fi
}

 # case $var in          
 #    Pattern 1) Statement 1;;
 #    Pattern n) Statement n;;  
 # esac 

a="greet"
b="bye"
c="hello"
case $b in
    $a) my_function ekansh ekansh1 ;;                 
    $b) echo "Goodbye from GeeksforGeeks" ;;
    *) echo "Invalid option. Use 'greet' or 'bye'." ;;
esac