#!/bin/sh

# usage: vlc-find [find options]
# example: vlc-find 
# example: vlc-find -a iname '*dvd*'

find . -type f -iname '*.mp4' -o -iname '*.avi' -o -iname '*.flv' -o -iname '*.mpeg' -o -iname '*.mpg' $@ \
    | sed -e 's#^.*cygdrive/c/\(.*\)$#c:/\1#' -e 's#\\#/#g' -e 's#\(.*\)#"\1"#' \
    | awk '{print} END {print "vlc://quit"}' \
    | tr '\n' ' ' \
    | xargs vlc -f --no-qt-error-dialogs
