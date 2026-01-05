#!/bin/bash

#he loop incremented by 2 units as mentioned in the curly braces.

for n in {1..5..2}; 
do
    echo $n
done

echo "-----"

for n in {1..5}; 
do
    echo $n
done

echo "-----"

n=7
for (( i=1 ; i<=$n ; i++ )); 
do
    echo $i
done

echo "-----"

s=("football" "cricket" "hockey") 
for n in ${s[@]}; 
do
    echo $n
done