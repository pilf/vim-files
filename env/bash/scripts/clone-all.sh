#!/bin/bash
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
export -f clone_or_pull
ssh git@grasslands.no-ip.org 'ls /src' | grep '\.git$' | for-all 'clone_or_pull $line'
