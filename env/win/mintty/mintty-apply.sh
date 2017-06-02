#!/bin/sh

opt="$(echo "$1" | tr /A-Z/ /a-z/)"
param="$2"

case "$opt" in
    cursorcolour)
        echo -ne "\\e]12;#$param\\a"
        ;;
    foregroundcolour)
        echo -ne "\\e]10;#$param\\a"
        ;;
    backgroundcolour)
        echo -ne "\\e]11;#$param\\a"
        ;;
    title)
        echo -ne "\\e]0;#$param\\a"
        ;;
    *)
        echo "Unknown option '$opt'" &1>2
        exit 1
        ;;
esac

