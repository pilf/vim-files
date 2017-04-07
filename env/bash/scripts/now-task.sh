#!/bin/bash

function mins_left
{
    parsed=$(echo "$1" | sed -E 's/\[([0-9]{2})([0-9]{2})·([0-9]+)\]/\1:\2 \3/')
    if [ "$parsed" != "$1" ]; then
        # parse successful 
        start=$(echo "$parsed" | sed -E 's/ .*$//')
        mins=$(echo "$parsed" | sed -E 's/^[0-9:]* //')
        target=$(( $(epoch-for-date.sh "$(now -D) $start:00") + $mins*60 ))
        work=$(epoch-for-date.sh "$(now -D) $(now -T)")
        echo $(( ($target - $work) / 60)) 
    fi
}

if [ ! "$(g workbench)" ]; then
    echo ".g.places doens't have a 'workbench' entry">&2
    exit 1
fi

workbench_file="$(g workbench)"
if [ ! -f "$workbench_file" ]; then
    echo "File defined by .g.places but either \"$workbench_file\" not a file or doesn't exist.">&2
    exit 2
fi

task=$(cat "$workbench_file" | \
    sed -e '/^>>TODOs/,$d' | \
    sed -n "/^$(now -D)/,\$p" | \
    sed -n '/^[TEGQ].*- *$/p' | \
    tail -n 1)

task=$(echo $task | sed -e 's/^.[ \.]*//' -e 's/-\s*$//')
if [ -z "$task" ]; then
    echo "*** idle ***"
else
    stripped_task=$(echo "$task" | sed -E 's/ \[.*\] - [sca]:[0-9]+//g')
    remaining=$(mins_left $(echo "$stripped_task" | sed -E 's/^.*(\[[0-9]{4}·[0-9]+\])[ -]*$/\1/'))
    echo $stripped_task | sed -E "s/\\[([0-9]{4}·[0-9]+)\\][ -]*$/[\1:$remaining]/"
fi
