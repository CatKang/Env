#!/bin/sh

bmd_hosts=`cat host_list`

user=""
target_file=""
command=""

#get all error
declare -i i
echo "====Begin to check ===="
for host in $bmd_hosts
do
  (( i++ ))
  echo
  echo "|| $host || i: $i"
  ./auto_go sudo scp -r $target_file $user@$host:~
  ./auto_go sudo ssh -A $user@$host $command
done
echo "====End  to check ===="
