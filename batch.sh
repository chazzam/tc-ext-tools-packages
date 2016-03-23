#!/bin/sh

if [ -z "$1" ]; then
  echo "Must provide a list of packages to build";
  exit 1;
fi;

for pkg in $@; do
  [ "$(echo $pkg|cut -c1-8)"="asterisk" ] && sudo rm -rf ../storage/linux/;
  buildit $pkg && cleanit $pkg;
done;
