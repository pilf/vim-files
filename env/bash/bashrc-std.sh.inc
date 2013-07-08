# Standard functions designed to be used in .bashrc (or .bash_profile)
# To use put the line:
#   source <location-of-this-file>

set -o vi
alias tp="export PS1='> '"

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

function kill-by-pattern {
    echo "Not yet implemented, but try something along the lines of:"
    echo "  ps -A | egrep 'pattern' | awk '{print $1}' | sort -n | head -1 | kill"
}
