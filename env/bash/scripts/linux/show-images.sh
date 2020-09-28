#!/bin/bash
set -x
dur=${1:-10}
mode=${2:seq}
cploc="${2:-$HOME/crypt/today}"

opts=""
case $mode in
    seq) 
        ;;
    r*) 
        opts="-z"
        ;;
    *)
        ;;
esac

feh -FZ.r --info "echo %f -- %u/%l" -D -$dur.0 --action1 "cp %F $cploc" $opts
