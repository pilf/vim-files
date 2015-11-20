#!/bin/bash
# Usage: clone-all.sh [target_dir]
# Note: Will use $(g $DEFAULT_SRC_SHORT_NAME) if available and no target_dir provided

DEFAULT_SRC_SHORT_NAME=xacsrc

function default_dir {
    if dir="$(g $DEFAULT_SRC_SHORT_NAME 2> /dev/null)"; then
        printf "$dir"
    else
        exit 1
    fi
}

function clone_or_pull {
    git_dir="$1"
    git_repo="${git_dir%.*}"
    if [ -d ./$git_repo ]; then
        printf "Pulling $git_repo... "
        cd $git_repo
        git pull
        cd ..
    else
        echo "New repo! cloing $git_repo"
        git clone git@grasslands.no-ip.org:/src/$line 
    fi
}

if [ ! -z "$1" ] && [ -d "$1" ]; then
    dir="$1"
else
    if ! dir=$(default_dir); then
        cat <<EOF 
Nothing returned for \$(g $DEFAULT_SRC_SHORT_NAME) using '.' instead."
About to clone into $(pwd)/ 

Press enter to continue . . . "
EOF
        read
        dir='.'
    fi
fi

cd $dir
echo "Cloning into $(pwd)"
export -f clone_or_pull
ssh git@grasslands.no-ip.org 'ls /src' | grep '\.git$'
#| for-all 'clone_or_pull $line'
