#!/usr/bin/env sh
mix_root="$(pwd | sed 's/\/lib\/.*//')"
rel_here="lib/$(pwd | sed 's/^.*\/lib\///')"

cd "$mix_root"
mix run --no-start "$1"
