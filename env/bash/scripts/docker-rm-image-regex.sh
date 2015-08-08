#!/bin/bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/docker_columns.inc.sh"

cmd="docker images"
match_printf_docker_columns "$cmd" "$*" '%s\n' 3 | for-all 'echo docker rmi -f $line'
