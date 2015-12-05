autoload zmv
autoload colors && colors
autoload -U compinit && compinit
autoload -Uz vcs_info

[[ "$TERM" == "xterm" ]] && export TERM=xterm-256color
export KEYTIMEOUT=1
bindkey -v
bindkey -a u undo
bindkey -a '^R' redo

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

## PROMPT
_newline=$'\n'
_lineup=$'\e[1A'
_linedown=$'\e[1B'

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
export RPROMPT="%{${_lineup}%}$vcs_info_msg_0_ %u %c: [%{$fg_no_bold[yellow]%}%?]%{$reset_color%}%{${_linedown}%}"
export PROMPT="%{$fg[cyan]%}$USER@$HOST%{$fg[white]%} |%{$fg[yellow]%} %~%{$reset_color%}%f ${_newline}\$ " 
zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s %{$reset_color%}%r/%S%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "
#zstyle ':vcs_info:git:*' formats '%b'
## PROMPT END

source "/home/philip/src/vim-files/env/bash/bashrc-std.sh.inc"
source "/home/philip/src/vim-files/env/bash/x.sh.inc"

