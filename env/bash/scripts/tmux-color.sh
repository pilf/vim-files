#!/bin/sh

# Usage:
#
#   tmux-color.sh [<scheme name> | -l | --list]
#
# Assumes you're in a Tmux session and attempts to read session name. 
# Searches for name in list of known schemes (e.g. 'blue') or if it
# multiword (seperated with dashes) then the last word is used
# e.g. 'myshell-dark' looks for 'dark' scheme.

if [ "$1" == "-l" ] || [ "$1" == "--list" ]; then
    cat $0 | grep '^".*)' | sed -e 's/"\(.*\)".*$/\1/' | sort
    exit 0
fi

defaultname=$(tmux display-message -p "#S" 2>/dev/null)
name=${1:-$defaultname}

stripped_name="$(printf "$name" | sed -n 's/^.*-\(.*\)$/\1/p')" 

search="$stripped_name"
if [ -z "$search" ]; then
    search="$name"
fi

bg="#2C3230"
fg="#FFFFFF"

#printf "Searching for name %s" "$stripped_name"

# ChatGPT's suggestions
#[
#  { "name": "Midnight Blue", "mode": "dark", "background": "#0B1C2D", "foreground": "#E6F1FF" },
#  { "name": "Solar Night", "mode": "dark", "background": "#002B36", "foreground": "#FDF6E3" },
#  { "name": "Graphite", "mode": "dark", "background": "#1E1E1E", "foreground": "#F5F5F5" },
#  { "name": "Deep Forest", "mode": "dark", "background": "#0B3D2E", "foreground": "#E8FFF6" },
#  { "name": "Plum Night", "mode": "dark", "background": "#2A0F2E", "foreground": "#F8EFFF" },
#  { "name": "Crimson Dusk", "mode": "dark", "background": "#3A0D0D", "foreground": "#FFECEC" },
#  { "name": "Charcoal Cyan", "mode": "dark", "background": "#102A43", "foreground": "#E0FBFC" },
#  { "name": "Obsidian Gold", "mode": "dark", "background": "#121212", "foreground": "#FFD166" },
#  { "name": "Night Teal", "mode": "dark", "background": "#003B44", "foreground": "#E0FFFF" },
#  { "name": "Violet Shadow", "mode": "dark", "background": "#1A102B", "foreground": "#F3E8FF" },
#
#  { "name": "Ivory Slate", "mode": "light", "background": "#FFFFF5", "foreground": "#2E2E2E" },
#  { "name": "Snow Blue", "mode": "light", "background": "#F0F8FF", "foreground": "#1B263B" },
#  { "name": "Mint Cream", "mode": "light", "background": "#F3FFF8", "foreground": "#064E3B" },
#  { "name": "Soft Peach", "mode": "light", "background": "#FFF5EB", "foreground": "#4A1C1C" },
#  { "name": "Lavender Mist", "mode": "light", "background": "#F8F4FF", "foreground": "#2D1B4E" },
#  { "name": "Pale Sand", "mode": "light", "background": "#FAF3E0", "foreground": "#3E2723" },
#  { "name": "Cloud Gray", "mode": "light", "background": "#F5F7FA", "foreground": "#1F2933" },
#  { "name": "Arctic Ice", "mode": "light", "background": "#EAF6FF", "foreground": "#0A2239" },
#  { "name": "Rose Light", "mode": "light", "background": "#FFF1F3", "foreground": "#4A0D1A" },
#  { "name": "Lemon Wash", "mode": "light", "background": "#FFFDE7", "foreground": "#3A2F00" }
#]

case $search in
"midnightblue") # dark
    bg="#0B1C2D"
    fg="#E6F1FF"
    ;;
"solarnight") # dark
    bg="#002B36"
    fg="#FDF6E3"
    ;;
"graphite")# dark
    bg="#1E1E1E"
    fg="#F5F5F5"
    ;;
"deepforest") # dark
    bg="#0B3D2E"
    fg="#E8FFF6"
    ;;
"plumnight") # dark
    bg="#2A0F2E"
    fg="#F8EFFF"
    ;;
"crimsondusk") # dark
    bg="#3A0D0D"
    fg="#FFECEC"
    ;;
"charcoalcyan") # dark
    bg="#102A43"
    fg="#E0FBFC"
    ;;
"obsidiangold") # dark
    bg="#121212"
    fg="#FFD166"
    ;;
"nightteal") # dark
    bg="#003B44"
    fg="#E0FFFF"
    ;;
"violetshadow") # dark
    bg="#1A102B"
    fg="#F3E8FF"
    ;;
"ivoryslate") # light
    bg="#FFFFF5"
    fg="#2E2E2E"
    ;;
"snowblue") # light
    bg="#F0F8FF"
    fg="#1B263B"
    ;;
"mintcream") # light
    bg="#F3FFF8"
    fg="#064E3B"
    ;;
"softpeach") # light
    bg="#FFF5EB"
    fg="#4A1C1C"
    ;;
"lavendermist") # light
    bg="#F8F4FF"
    fg="#2D1B4E"
    ;;
"palesand") # light
    bg="#FAF3E0"
    fg="#3E2723"
    ;;
"cloudgray") # light
    bg="#F5F7FA"
    fg="#1F2933"
    ;;
"arcticice") # light
    bg="#EAF6FF"
    fg="#0A2239"
    ;;
"roselight") # light
    bg="#FFF1F3"
    fg="#4A0D1A"
    ;;
"lemonwash") # light
    bg="#FFFDE7"
    fg="#3A2F00"
    ;;

"general")
   bg="#001943"
   ;;
"blue")
   bg="#001943"
   ;;
"today")
   bg="#221C35"
   ;;
"toneq")
   bg="#231A21"
   ;;
"dark")
   bg="#231A21"
   ;;
"purple")
   bg="#4A1AA1"
   fg="#61E061"
   ;;
"darkpurple")
   bg="#200645"
   fg="#71E071"
   ;;
"red")
   bg="#4A081A"
   ;;
"darkred")
   bg="#2A0008"
   fg="#FFE8E8"
   ;;
"darkgreen")
   bg="#082A1A"
   ;;
"darkblue")
   bg="#080A28"
   ;;
"scripts")
   bg="#1D1F1C"
   ;;
"careful")
    bg="#FFCCD1"
    fg="#4d4a4b"
    ;;
"red")
    bg="#FFCCD1"
    fg="#4d4a4b"
    ;;
"light")
    bg="#f1ebeb"
    fg="#24c0eb"
    ;;
"dark")
    bg="#0D0F0C"
    fg="#FFFFFF"
    ;;
*)
    bg="#DAFBF8"
    fg="#002222"
esac

tmux select-pane -t:. -P "bg=$bg,fg=$fg" 2>/dev/null
