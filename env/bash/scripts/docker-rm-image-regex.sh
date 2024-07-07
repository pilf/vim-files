#!/usr/bin/env bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/docker_columns.inc.sh"

pattern="$*"
cmd="docker images"

count=$(docker_match_count "$cmd" "$pattern")

if [ "0" = "$count" ]; then
    echo No images found to remove
    exit 0
fi 

echo You are about to delete $count images
match_printf_docker_columns "$cmd" "$pattern" '%s:%s (%s %s)\n' 1 2 5 4

read -r -p "Are you sure? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 
        match_printf_docker_columns "$cmd" "$pattern" '%s\n' 3 | for-all 'docker rmi -f $line'
        ;;
    *)
        echo "Aborted"
        ;;
esac

