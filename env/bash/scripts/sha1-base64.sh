#!/bin/bash
sha1sum.exe | sed -e 's/ .*$//' | xxd -r -p | base64 | sed '/^$/d'
