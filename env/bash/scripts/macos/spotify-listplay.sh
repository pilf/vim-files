#!/usr/bin/env bash

savefile="$HOME/.spotify-list"
pattern="$1"

if [ -z "$pattern" ]; then
    echo "----------------------------------------"
    cat $savefile | sed 's/spotify:\([^:]*\).*\|\(.*\)/[\1] \2/' | sort
    echo "----------------------------------------"
    exit 0
fi

# Character set to use for numbering
chars=( {0..9} {a..z} )

i=0

# Array to store filtered lines
declare -a lines

# Grep the file for the pattern and read each matching line
while IFS= read -r line; do
    lines[$i]="$line"
    ((i++))
done < <(grep -i "$pattern" "$savefile")

# Check if any lines were found
if [ ${#lines[@]} -eq 0 ]; then
    echo "No lines matching pattern '$pattern' found."
    exit 1
fi

# only one candidate found, go with that
if [ ${#lines[@]} -eq 1 ]; then
    printf "%s\n" "$(echo "${lines[0]}" | sed 's/^.*|//')"
    printf "${lines[0]}" | grep -o '^[^|]*' | xargs -I{} spotify play track \"{}\"
    exit 0
fi

# Otherwise we found multiple possible matches, get user to choose...

# Print matching lines with indexing
for (( j=0; j<${#lines[@]}; j++ )); do
    display_line=$(echo ${lines[$j]} | sed 's/.*|\(.*\)/\1/')
    echo "[${chars[$j]}] $display_line"
done

# Wait for a key press and output the corresponding line
echo
echo "Select track to play"

while true; do
    # Read a single character
    read -n 1 -s key

    # Find the index of the pressed key in the chars array
    for idx in "${!chars[@]}"; do
        if [[ "${chars[$idx]}" == "$key" ]]; then
            # Print the corresponding line
            echo "${lines[$idx]}"
            printf "%s\n" "$(echo "${lines[$idx]}" | sed 's/^.*|//')"
            printf "${lines[$idx]}" | grep -o '^[^|]*' | xargs -I{} spotify play track \"{}\"
            exit 0
        fi
    done
done

#if [ -z "$search" ]; then
#    cat $savefile | sed -e 's/^.*\|//'
#    exit 0
#fi
#
#track=$(cat $savefile | grep -i "$search" | head -n1)
#
#if [ ! -z "$track" ]; then
#    printf "%s\n" "$(echo "$track" | sed 's/^.*|//')"
#    printf "$track" | grep -o '^[^|]*' | xargs -I{} spotify play track \"{}\"
#fi
