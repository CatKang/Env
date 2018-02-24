#!/bin/sh


source_auth=$1
target_auth=$2
repo=$3

mkdir /tmp/source_auth
mkdir /tmp/target_auth

git clone git@github.com:$source_auth/$repo.wiki.git /tmp/source_auth/$repo.wiki
git clone git@github.com:$target_auth/$repo.wiki.git /tmp/target_auth/$repo.wiki

cp /tmp/source_auth/$repo.wiki/*md /tmp/target_auth/$repo.wiki/

cd /tmp/target_auth/$repo.wiki/

git add *

git commit -m "add wiki"

git push origin master

rm -rf /tmp/source_auth /tmp/target_auth
