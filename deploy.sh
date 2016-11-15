#!/bin/sh

host=$1
username=""

# Clean Env
echo "Clean Remote Env..."
ssh -A $username@$host "rm Env_bak && mv Env Env_bak"

# Send Env
echo "Send Env to Remote..."
cd ~
tar -czf Env.tar.gz Env
scp Env.tar.gz $username@$host:~/
rm Env.tar.gz
ssh -A $username@$host "cd ~ && tar -xzvf Env.tar.gz && rm Env.tar.gz"

# Soft link
echo "Make Soft Link"
ssh -A $username@$host "cd ~/Env && sh install.sh"
