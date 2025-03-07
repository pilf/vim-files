#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")"

# Determine the target directory based on OS
if [[ "$(uname)" == "Darwin" ]]; then
    TARGET_DIR="$HOME/.qutebrowser"
else
    TARGET_DIR="$HOME/.config/qutebrowser"
fi

# Fail if the target directory does not exist
if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Error: Target directory $TARGET_DIR does not exist. Please create it first."
    exit 1
fi

# Create symbolic links for all files in SCRIPT_DIR, excluding the script itself
for file in "$SCRIPT_DIR"/*; do
    if [[ -f "$file" && "$(basename "$file")" != "$SCRIPT_NAME" ]]; then
        if [[ -e "$TARGET_DIR/$(basename "$file")" ]]; then
            echo "Warning: $(basename "$file") already exists in $TARGET_DIR, skipping."
        else
            ln -s "$file" "$TARGET_DIR/$(basename "$file")"
            echo "Linked $(basename "$file") to $TARGET_DIR"
        fi
    fi
done
