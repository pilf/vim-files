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
# Actually, on Linux the __ seems like an error, so two versions
#if [ -e ~/.exrc.exs ]; then
#    #alias mviex='rlwrap -a __ -c -H "~/.iex_history" -S ~/.iexrc.exs -r iex'
#    #alias viex='rlwrap -a -c -H "~/.iex_history" -S ~/.iexrc.exs -r iex' 
#else
#fi
alias mviex='rlwrap -a __ -c -H "~/.iex_history" -r iex'
alias viex='rlwrap -a -c -H "~/.iex_history" -r iex' 

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

function short_pwd {
    printf $(ellipsisify "$(pwd | sed "s|^$HOME|~|")" "$1")
}

pathadd $HOME/bin
pathadd $HOME/bin/scripts
# Should be conditinally included of course
pathadd $HOME/bin/scripts/osx


if [ "$bash4_path" != "" ]; then 
    export tmux_shell=$bash4_path
else
    export tmux_shell=/bin/bash
fi
if [[ "${BASH_VERSION::1}" -eq 4 ]]; then
    #[[ $- == *i* ]] && git-promptn.sh
    source git-prompt.sh
    export GIT_PS1_SHOWCOLORHINTS=1
    export GIT_PS1_SHOWDIRTYSTATE=1
    user=$(whoami)
    short_user=$(ellipsisify $user 7 left)
    short_host=$(ellipsisify $HOSTNAME 5 left)
    export PROMPT_COMMAND='__git_ps1 "\[\033[1;30m\]$short_user@$short_host\[\033[0m\]:\[\033[0;33m\]$(short_pwd 25)\[\033[0m\]" "\\\$ "'
fi

alias c='function __gcd() { cd "$(g $1)"; unset -f __gcd; }; __gcd'
alias gc='g -c $@'
alias ct='cd $(today)'
alias ts=tmux-simple 
alias hog="tree --du -h | egrep -v '[0-9]K?\]'"
# BTW session_autoload is confusingly stronger (i.e. doesn't ask, doesn't prompt) than 'yes'.  The default is 'prompt'.
alias vims="vim -c \"let g:session_directory = '$(g vim-sessions 2>/dev/null || printf $HOME)'|let g:session_autoload = 'yes'|let g:session_autosave = 'yes'|let g:session_autosave_periodic = 1\""
alias lynx="lynx -vikeys"

# Grasslands specific
alias gllex="ssh-tmux philip@elixir-erl17"
alias glrex="ssh philip@grasslands.no-ip.org -t bash -c \"'bin/scripts/ssh-tmux philip@elixir-erl17'\""
alias gll="ssh-tmux philip@grasslands"
alias glr="ssh-tmux philip@grasslands.no-ip.org" 

# OS X specific
alias boot2docker-start='eval $(/usr/local/bin/boot2docker shellinit) && $(/usr/local/bin/boot2docker up)'

# Docker specific
alias dcn=container-named.sh
alias din=docker-image-one.sh
alias de=docker-exec.sh
alias devbox='docker-exec.sh devbox bash;echo'

