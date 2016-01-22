__last_command=
__raw=
__dataonly=
__linecount=

get_docker_column_positions() {
    headers=$(echo "$1" | head -n1)
    linewidth=$(echo "$1" | awk '{ print length}' | sort | tail -n1)

    echo "$1" \
            | head -n1 \
            | sed -e 's/\([A-Z]\) \([A-Z]\)/\1_\2/g' -e 's/ \([^ ]\)/±\1/g' \
            | awk 'BEGIN{FS="±"} END { for(i=1;i<=NF;i++) {printf("%d\n", length($i)+1, $i) }}' \
            | tr '\n' ' ' \
            | tee `today`/s7
}

run_cmd_if_different() {
    cmd="$1"
    if [ -z "$__last_command" ] || [ "$__last_command" != "$cmd" ]; then
        __raw=$($cmd)
        __dataonly="$(echo "$__raw" | tail -n+2)"
        __linecount="$(echo "$__dataonly" | wc -l | tr -d ' ')"
        __last_command="$cmd"
    fi
}
__awk_format() {
    data="$1"
    fmt_pattern="$2"
    fields="$3"

    fieldwidths=$(get_docker_column_positions "$__raw") 
echo "[__awk_format] -> positions: $fieldwidths" 1>&2
    echo "$data" | tee `today`/s8 | awk "
        BEGIN { FIELDWIDTHS=\"$fieldwidths\" } 
        function ltrim(s) { sub(/^[ \\t\\r\\n]+/, \"\", s); return s }
        function rtrim(s) { sub(/[ \\t\\r\\n]+$/, \"\", s); return s }
        function trim(s)  { return rtrim(ltrim(s)); }
        { printf \"$fmt_pattern\"$fields }" 
}

docker_match_count() {
    # usage: docker_match_count "docker images"
    cmd="$1"
    pattern="$2"

    run_cmd_if_different "$cmd"
    echo "$__dataonly" | grep "$pattern" | wc -l | tr -d ' '
}

printf_docker_columns() {
    # usage: printf_docker_columns 'docker images' '%s - %s' 1 2
    cmd="$1"
    pattern="$2"
printf "cmd (printf_docker_columns): '%s', pattern: '%s'\n" "$cmd" "$pattern" 1>&2
    shift
    shift
    fields=$(echo $* | sed -e 's:\([0-9][0-9]*\):, trim($\1):g')

    run_cmd_if_different "$cmd"

    __awk_format "$__dataonly" "$pattern" "$fields"
}

match_printf_docker_columns() {
    # usage: match_printf_docker_columns 'docker images' 'devbox' '%s - %s' 1 2
    cmd=$1
    pattern=$2
    fmt_pattern=$3
    shift
    shift
    shift
    fields=$(echo $* | sed -e 's:\([0-9][0-9]*\):, trim($\1):g')

    run_cmd_if_different "$cmd"

    filtered_data=$(echo "$__dataonly" | grep "$pattern")
    __awk_format "$filtered_data" "$fmt_pattern" "$fields"
}
