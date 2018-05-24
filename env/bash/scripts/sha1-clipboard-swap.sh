#!/bin/sh
# Script that takes what's in /dev/clipboard, encodes it and replaces with sha1 in string hex form
cat /dev/clipboard  | sha1sum.exe | sed 's/ .*$//' | tr -d '\n' > /dev/clipboard
