#!/bin/bash
input="$1"
# possible themes: 
# - bootstrap3 (looks ok, but has "Project name" and other options at top -- which are generic "Project name", "Link" etc.)
# - github (it's a classic, light mid-wide, see github :)
# - jasonm23-dark (ok simple dark theme, not justified but text is thiner than code and looks odd))
# - jasonm23-foghorn (thin, justified text, doesn't work so well on high zoom)
# - jasonm23-markdown (ok, github like, not justified)
# - jasonm23-swiss (good, clean)
# - markedapp-byword (ok, light-mid/grey )
# - mixu-book (good, light, clean, has a useful contents link at top)
# - mixu-bootstrap (were it not for the top bar it would be good.  Nice light and wide)
# - mixu-bootstrap-2col (pretty useful, not sure about green links but has a left-hand contents; and mid-to-wide)
# - mixu-gray (good, similar to mixu-bootstrap-2col; better colours)
# - mixu-page (nothing special, light and text doesn't use all space on my browser)
# - mixu-radar (good; light layout with perminant contents on right hand side)
# - roryg-ghostwriter (looks nice enough but dosn't format code well)
# - thomasf-solarizedcssdark (kind of ugly, but wide and dark)
# - thomasf-solarizedcsslight (wide and colourful, and ugly again but this time with a peachy-yellow background)
# - witex (ok, justified text, quite attractive)
theme="${2:-mixu-radar}" 
prefix="${3:-tmpmdfile}"

if [ -z "$input" ] || [ ! -f "$input" ]; then
    cat <<EOF 1>&2
*** Error: Must provide a MD file
Usage: $0 <md file> [theme]
$(generate-md --input "$input" --layouts)
EOF
    exit 1
fi

if ! command -v generate-md 2>&1 >/dev/null ;  then
    cat <<EOF 1>&2
*** Error: generate-md is not installed.
    Can be installed via npm -- so node is required too:
    $ sudo npm install -g markdown-styles
Usage: $0 <md file> [theme]
EOF
    exit 2
fi

set -x
tmpname="$(mktemp -d "$prefix.XXXX")"

# this shouldn't really be needed, but adding "---\n\n" to top of md file 
# forces correct rendering for me (without this it cuts off top)
preped_input="$tmpname/adj-$(basename $input)"
printf "\n---\n\n" > "$preped_input"
cat "$input" >> "$preped_input"

#mv "$tmpname" "$tmpname.html"
generate-md --input "$preped_input" --layout "$theme" --output "$tmpname/" 2> /dev/null || cat <<EOF 1>&2
There was an error processing.  Theme used: $theme
$(generate-md --input "$input" --layouts)
EOF
htmlfile="$tmpname/$(basename "$preped_input" | cut -f1 -d'.').html"

if [ "$(uname -s)" == "Darwin" ]; then
    open -a qutebrowser "$htmlfile" || open -b com.google.chrome "$htmlfile" || exit 1
else
    printf "Not on a MAC, here's the file you're looking for: \n\t%s" $htmlfile
fi
set +x
