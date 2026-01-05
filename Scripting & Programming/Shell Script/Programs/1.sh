#!/bin/bash
echo "age daal"
read Age
if [ $Age -ge 18 ];
then
echo "You are eligible to vote."
echo "Age is $Age"
else
echo "You are not eligible to vote."
fi
