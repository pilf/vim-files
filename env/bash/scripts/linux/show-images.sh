#!/bin/bash
set -x
dur=${1:-10}
cploc="${1:-$HOME/crypt/today}"
feh -FZ.r --info "echo %f -- %u/%l" -D -$dur.0 --action1 "cp %F $cploc"
