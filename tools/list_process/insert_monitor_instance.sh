#!/bin/bash

# specify CSV file name
file=$1

while IFS=, read -r col1 col2
do
    # Remove the double quotation marks from each column
    column1=$(echo $col1 |  sed 's/^"\(.*\)"$/\1/')
    column2=$(echo $col2 |  sed 's/^"\(.*\)"$/\1/')

  echo "insert monitor instance $column1  ---  $column2"
  mysql -h $host -u$user -p$password -D $database -e "insert into instance(ins_logical, nick_name) values ('$column1', '$column2')"

done < "$file"

