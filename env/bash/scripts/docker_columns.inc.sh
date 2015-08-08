__last_command=
__raw=
__dataonly=
__linecount=

function get_docker_column_positions {
    headers=$(echo "$1" | head -n1)
    linewidth=$(echo "$1" | wc -L)

    echo "$1" \
            | head -n1 \
            | sed -e 's/\([A-Z]\) \([A-Z]\)/\1_\2/g' \
            | grep -ob ' [^ ]' \
            | sed -e 's/:.*$//' \
            | awk -v lw="$linewidth" 'BEGIN { l=0 } { print $0-l; l=$0 } END { print lw-l }' \
            | tr "\\n" " " | sed -e "s/\(^.*\)\(.$\)/\1/"
}

function run_cmd_if_different {
    cmd=$1
    if [ -z "$__last_command" ] || [ "$__last_command" != "$cmd" ]; then
        __raw=$(docker images)
        __dataonly=$(echo "$__raw" | tail -n+2)
        __linecount=$(echo "$__dataonly" | wc -l)
        __last_command=$cmd
    fi
}

function docker_match_count {
    # usage: docker_match_count "docker images"
    run_cmd_if_different "$1"
    echo $__linecount
}
function printf_docker_columns {
    # usage: printf_docker_columns 'docker images' '%s - %s' 1 2
    cmd=$1
    pattern=$2
    shift
    shift
    fields=$(echo $* | sed -e 's:\([0-9][0-9]*\):, trim($\1):g')
    #printf '\n>>%s %s %s' $pattern $fields

    run_cmd_if_different "$cmd"

    fieldwidths=$(get_docker_column_positions "$__raw") 
    #echo $fieldwidths
    echo "$__dataonly" | awk "
        BEGIN { FIELDWIDTHS=\"$fieldwidths\" } 
        function ltrim(s) { sub(/^[ \\t\\r\\n]+/, \"\", s); return s }
        function rtrim(s) { sub(/[ \\t\\r\\n]+$/, \"\", s); return s }
        function trim(s)  { return rtrim(ltrim(s)); }
        { printf \"$pattern\"$fields }" 1>&2 
}
