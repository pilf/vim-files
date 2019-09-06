#set -x
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
	export PATH="${PATH:+"$PATH:"}$1"
    fi
}

function start-ssh-agent {
    ssh-agent sh -c 'ssh-add < /dev/null && bash'
}

function short_pwd {
    printf $(ellipsisify "$(pwd | sed "s|^$HOME|~|")" "$1")
}

function git_prompt_setup {
    short_user="$1"
    short_host=$(ellipsisify $HOSTNAME 12 left)
    export PROMPT_COMMAND='__posh_git_ps1 "\[\033[1;30m\]$short_user@$short_host\[\033[0m\]:\[\033[0;33m\]$(short_pwd 25)\[\033[0m\]" "\\\$ "'
}

pathadd $HOME/bin
pathadd $HOME/bin/scripts
# Should be conditinally included of course
pathadd $HOME/bin/scripts/osx

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -n "$shell_override" ]; then 
    export tmux_shell="$shell_override"
else
    export tmux_shell=/bin/bash
fi

# zsh seems to need explict start (0)
bashversion="${BASH_VERSION:0:1}"
zshversion="${ZSH_VERSION:0:1}"

if [ "$bashversion" -eq "4" ] || [ "$bashversion" -eq "5" ] || [ -n "$zshversion" ]; then
    export GIT_PS1_SHOWCOLORHINTS=1
    export GIT_PS1_SHOWDIRTYSTATE=1
    user=$(whoami)
    short_user=$(ellipsisify $user 7 left)

    source git-prompt.sh 
    git_prompt_setup "$short_user"
else
    echo "Using bash binary at $tmux_shell"
    echo "Info: Bashversion != 4 ($bashversion) || -n zshversion ($zshversion)" 1>&2
fi 

unalias g 2> /dev/null
alias c='function __gcd() { cd "$(g $1)"; unset -f __gcd; }; __gcd'
alias gc='g -c $@'
alias ct='cd $(today)'
alias ts=tmux-simple 
alias tns=tmux-ns.sh
alias tc=tmux-color.sh
alias hog="tree --du -h | egrep -v '[0-9]K?\]'"
# BTW session_autoload is confusingly stronger (i.e. doesn't ask, doesn't prompt) than 'yes'.  The default is 'prompt'.
#alias vims="vim -c \"let g:session_directory = '$(g vim-sessions 2>/dev/null || printf $HOME)'|let g:session_autoload = 'yes'|let g:session_autosave = 'yes'|let g:session_autosave_periodic = 1\""
alias lynx="lynx -vikeys"
alias careful='clear && echo Careful | figlet -f starwars '
alias host_here="python3 -m http.server"

# vim-itis
alias ":q"=exit

# Grasslands specific
alias gllex="ssh-tmux philip@elixir-erl17"
alias glrex="ssh philip@grasslands.no-ip.org -t bash -c \"'bin/scripts/ssh-tmux philip@elixir-erl17'\""
alias gll="ssh-tmux philip@grasslands"
alias glr="ssh-tmux philip@grasslands.no-ip.org" 
alias glld="ssh-tmux-docker philip@grasslands"
alias glrd="ssh-tmux-docker philip@grasslands.no-ip.org" 

# EC2 specific
alias ec2="ssh-pem-tmux ubuntu@ec2-52-19-100-128.eu-west-1.compute.amazonaws.com keys/motheralianpair.pem"

# OS X specific
alias boot2docker-start='eval $(/usr/local/bin/boot2docker shellinit) && $(/usr/local/bin/boot2docker up)'

# Docker specific
alias dcn=container-named.sh
alias din=docker-image-one.sh
alias de=docker-exec.sh
alias docker-go="'/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'"

# Git specific
alias gitdiff="GIT_PAGER='vim -R -' git diff --no-color"

# Tmux specific
alias ppid='ps -p'
alias tmux-tree="pstree $(ppid $$)"

# Node
alias vnode='rlwrap -a -c -H "~/.node_history" -r node' 


# http://askubuntu.com/questions/339546/how-do-i-see-the-history-of-the-commands-i-have-run-in-tmux
# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups
# append history entries..
shopt -s histappend
# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


# mintty
alias mintty-grasslands="bash -lc '. \$HOME/.bashrc && sh \$(g vf)/env/win/mintty/grasslands-theme.sh && ssh-tmux philip@grasslands'"

# Alas this doesn't work within tmux, but nice to have maybe.  Solved with tmux option set-title(-string)
settitle ()
{
   echo -ne "\e]2;$@\a\e]1;$@\a";
}

tmux-color.sh

set +x
