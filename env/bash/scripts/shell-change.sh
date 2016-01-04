#!/bin/bash
# to read: dscl /Search -read /Users/$USER UserShell 
sudo dscl . -change /Users/philipcox UserShell /bin/bash /usr/local/bin/bash
