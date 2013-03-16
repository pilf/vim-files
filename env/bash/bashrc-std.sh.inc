# Standard functions designed to be used in .bashrc (or .bash_profile)
# To use put the line:
#   source <location-of-this-file>

set -o vi
alias tp="export PS1='> '"

function today {
    TodayLoc=~/tmp/`date '+%Y%m%d'`
    
    if [ ! -d "$TodayLoc" ]; then
        mkdir -p "$TodayLoc"
    fi

    echo $TodayLoc
}

function for-all {
    if [ -z "$1" ]; then
        echo "Example usage: "
        echo "  # cat to stdout all files matching 'example' but that don't end in 'bin'"
        echo "  ls | grep example | grep -v bin$ | for-all 'cat \$line'"
        echo
    else
        while read line; do eval "$1"; done
    fi
}
