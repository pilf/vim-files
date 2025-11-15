#!/usr/bin/env bash

# Check for input
if [ -z "$1" ]; then
    echo "Usage: $0 'text to render'"
    exit 1
fi

INPUT="$1"

# Figlet font directory (Homebrew installs here)
FONTDIR="$(brew --prefix figlet)/share/figlet/fonts"

# Iterate over fonts in alphabetical order
for font in $(ls "$FONTDIR"/*.flf | sort); do
    fontname=$(basename "$font" .flf)
    echo "=============================="
    echo "FONT: $fontname"
    echo "=============================="
    figlet -f "$fontname" "$INPUT"
    echo
done
