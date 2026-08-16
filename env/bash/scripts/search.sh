#!/bin/sh

exclude_rg=""
search_targets="."
# CHANGED: Use --sort=modified instead of --sortr=modified for latest first
sort_opt="--sortr=path"

while [ $# -gt 0 ]; do
    case "$1" in
        -e)
            if [ -z "$2" ]; then
                echo "Error: -e requires an argument" >&2
                exit 1
            fi
            exclude_rg="$exclude_rg --glob '!$2'"
            shift
            ;;
        --no-order)
            sort_opt=""
            ;;
        -*)
            echo "Usage: search.sh [-e exclude_dir] [--no-order] [search_target]" >&2
            exit 1
            ;;
        *)
            if [ "$search_targets" = "." ]; then
                search_targets="$1"
            else
                search_targets="$search_targets $1"
            fi
            ;;
    esac
    shift
done

echo "Searching in: $search_targets${exclude_rg:+ (excluding:$exclude_rg)}"

fzf --layout=default \
  --phony \
  --ansi \
  --wrap-word \
  --delimiter ':' \
  --bind "start:reload:rg $sort_opt --hidden --line-number --no-heading --color=always $exclude_rg '' $search_targets" \
  --bind "change:reload:rg $sort_opt --ignore-case --hidden --line-number --no-heading --color=always $exclude_rg {q} $search_targets" \
  --bind 'enter:execute(${EDITOR:-vim} {1} +{2})' \
  --preview 'bat --style=numbers,changes --theme=Dracula --color=always --highlight-line {2} --line-range {2}: {1}' \
  --preview-window 'up,60%,border-bottom'

#  alternative
#  --bind "start:reload:rg --sortr=modified --hidden --line-number --no-heading --color=always $exclude_rg '' $search_targets" \
#  --bind "change:reload:rg --sortr=modified --ignore-case --hidden --line-number --no-heading --color=always $exclude_rg {q} $search_targets" \
#  --bind 'enter:execute(${EDITOR:-vim} -R {1} +{2})' \

