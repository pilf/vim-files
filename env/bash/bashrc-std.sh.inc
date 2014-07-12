# Standard functions designed to be used in .bashrc (or .bash_profile)
# To use put the line:
#   source <location-of-this-file>

set -o vi
alias tp="export PS1='> '"
export EDITOR='vim'

# It's a triffle confusing.  But HISTFILESIZE is the amount stored in the history file 
# (as specified by $HISTFILE, usually ~/.bash_history).  HISTSIZE is the amount of history stored in
# in memory (on shell exit this history is dumped to HISTFILE).  Not a very large HISTSIZE will mean
# bash has to load loads of lines into memory on start-up, so it's a toss up really.
# This is the best explanation I could find: http://mywiki.wooledge.org/BashFAQ/088
HISTFILESIZE=10000
HISTSIZE=1500

# For readline access in eix; requires rlwrap (obviously, can brew and I presume apt–get)
# .iex_history, which holds a history between sessions (quite cool), might need to
# be 'touch'ed.
# You'll probably also need ~/.inputrc" to have the line 'set editing-mode vi'.
# Also, the -a option seems to be needed, at least on the mac, for it to work.  However
# it seems to complain if there's no parameter (even though it claims it's optional);
# further if only one char is used all becomes astrix.  Hence '-a __'.
# And another thing... It complains if you Node.connect :"a@b" has some weirdnesses,
# complaining about unsafe_to_atom; if if you assign identifier to variable that works.
alias viex='rlwrap -a __ -c -H "~/.iex_history" -r iex'

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

function pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
	PATH="${PATH:+"$PATH:"}$1"
    fi
}

function start-ssh-agent {
    ssh-agent sh -c 'ssh-add < /dev/null && bash'
}

pathadd $HOME/bin
pathadd $HOME/bin/scripts

if [ "$bash4_path" != "" ]; then 
    export tmux_shell=$bash4_path
else
    export tmux_shell=/bin/sh
fi
if [[ "${BASH_VERSION::1}" -eq 4 ]]; then
    echo "running git prompt"
    #[[ $- == *i* ]] && git-prompt.sh
    git-prompt.sh
    PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
else
    echo "${BASH_VERSION::1}"
fi
