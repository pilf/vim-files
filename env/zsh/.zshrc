autoload zmv
autoload colors && colors
autoload -U compinit && compinit
autoload -Uz vcs_info && vcs_info

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
##_newline=$'\n'
##_lineup=$'\e[1A'
##_linedown=$'\e[1B'
##export PROMPT="%{$fg[cyan]%}$USER@$HOST%{$fg[white]%} |%{$fg[yellow]%} %~%{$reset_color%}%f ${_newline}\$ " 
##export RPROMPT="%{${_lineup}%}${vcs_info_msg_0_} ${vcs_info_msg_1_}: [%{$fg_no_bold[yellow]%}%?]%{$reset_color%}%{${_linedown}%}"

###autoload -Uz vcs_info
###zstyle ':vcs_info:*' enable git 
###precmd() { 
###    vcs_info 
###} 
###setopt prompt_subst 
###zstyle ':vcs_info:git:*' check-for-changes true 
###zstyle ':vcs_info:*' formats "%f[%%n@%%m %1~] $ " "%f%a %F{3}%m%u%c %f%b:%r/%S" 
###zstyle ':vcs_info:*' nvcsformats "%f[%n@%m %1~]$ " "" 
###zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f ' 
###PROMPT='${vcs_info_msg_0_}' 
###RPROMPT='${vcs_info_msg_1_}'
## PROMPT END

#source "prompt.zsh"

source "/Users/philipcox/code/vim-files/env/bash/bashrc-std.sh.inc"
source "/Users/philipcox/code/vim-files/env/bash/x.sh.inc"
