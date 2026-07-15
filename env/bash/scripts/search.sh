#!/bin/sh

exclude_rg=""
search_targets="."

while getopts "e:" opt; do
    case $opt in
        e) exclude_rg="$exclude_rg --glob '!$OPTARG'" ;;
        *) echo "Usage: search.sh [-e exclude_dir] ... [search_target]" >&2; exit 1 ;;
    esac
done
shift $((OPTIND - 1))

[ -n "$1" ] && search_targets="$1"

echo "Searching in: $search_targets${exclude_rg:+ (excluding:$exclude_rg)}"

fzf --layout=default \
  --phony \
  --ansi \
  --wrap-word \
  --delimiter ':' \
  --bind "start:reload:rg --sortr=modified --hidden --line-number --no-heading --color=always $exclude_rg '' $search_targets" \
  --bind "change:reload:rg --sortr=modified --ignore-case --hidden --line-number --no-heading --color=always $exclude_rg {q} $search_targets" \
  --bind 'enter:execute(${EDITOR:-vim} {1} +{2})' \
  --preview 'bat --style=numbers,changes --theme=Dracula --color=always --highlight-line {2} --line-range {2}: {1}' \
  --preview-window 'up,60%,border-bottom'



#fzf --layout=default \
# --phony \
# --ansi \
# --delimiter ':' \
# --bind 'change:reload:rg --hidden --line-number --no-heading --color=always {q} ./guestline.toneq2 ./.toneq.guestline' \
# --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
# --preview-window 'up,60%,border-bottom'
