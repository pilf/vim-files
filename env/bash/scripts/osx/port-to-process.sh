#!/bin/sh
# Currently only works on Mac.  I think you can use netstat on Linux (-o?)
lsof -i :4100 | awk 'NR>1 {print $2}' | xargs ps xu -p
