#!/bin/bash
if [ -z "$1" -o "$1" != "force" ]; then
  echo "This will delete recursively all subdirectories containing name 'cache' and 'build'"
  echo "Use: "$0 force" to actually run it"
  exit
fi

find -iname "cache" |xargs rm -rf
find -iname "build" |xargs rm -rf

