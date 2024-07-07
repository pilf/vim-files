#!/usr/bin/env bash
# to read: dscl /Search -read /Users/$USER UserShell 
sudo dscl . -change /Users/$USER UserShell /bin/bash /usr/local/bin/bash
