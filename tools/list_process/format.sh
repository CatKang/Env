#!/bin/bash

# specify CSV file name
file=$1

while IFS=, read -r col1 col2
do
    # Remove the double quotation marks from each column
    column1=$(echo $col1 |  sed 's/^"\(.*\)"$/\1/')
    column2=$(echo $col2 |  sed 's/^"\(.*\)"$/\1/')

  echo "$column1" >> formated

done < "$file"

