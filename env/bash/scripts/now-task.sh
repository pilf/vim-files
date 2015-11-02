if [ ! $(g workbench) ]; then
    echo ".g.places doens't have a 'workbench' entry">&2
    exit 1
fi

workbench_file=$(g workbench)
if [ ! -f "$workbench_file" ]; then
    echo "File defined by .g.places but either \"$workbench_file\" not a file or doesn't exist.">&2
    exit 2
fi

task=$(cat $workbench_file | \
    sed -e '/^>>TODOs/,$d' | \
    sed -n "/^$(now -D)/,\$p" | \
    sed -n '/^[TE].*- *$/p' | \
    tail -n 1)
task=$($task | sed -e 's/^.[ \.]*//' -e 's/-\s*$//')
if [ -z "$task" ]; then
    echo "*** idle ***"
else
    echo $task
fi
