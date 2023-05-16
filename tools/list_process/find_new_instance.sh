#!/bin/bash

# Check if both files exist
if [ ! -f "$1" ] || [ ! -f "$2" ]; then
  echo "Both files must exist."
  exit 1
fi

## Check if all lines in file1 exist in file2
#while read -r line; do
#  if ! grep -qF "$line" "$2"; then
#    echo "Line '$line' from file1 does not exist in file2."
#    exit 1
#  fi
#done < "$1"

# Write the lines only present in file2 to a new file
grep -vxFf "$1" "$2" > file2_only.txt

echo "File2-only lines written to file2_only.txt."
exit 0

