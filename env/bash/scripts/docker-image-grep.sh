#!/usr/bin/env bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/docker_columns.inc.sh"

cmd="docker images"
match_printf_docker_columns "$cmd" "$*" '%s:%s (%s %s)\n' 1 2 5 4
