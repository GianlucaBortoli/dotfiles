[ -z "$PS1" ] && return

export EDITOR=/usr/bin/vim
export SHELL=/bin/bash
export HUGINHOME=/usr/local/hugin

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

alias mkdir='mkdir -p'
alias ls='ls -h --color'
alias ll='ls -alh --color'
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
alias dsize='du -sh'
alias make="make -j 4"
alias open="gnome-open"

# PS1 style
function prompt {
    source /etc/bash_completion.d/git-prompt

    # 30m - Black
    # 31m - Red
    # 32m - Green
    # 33m - Yellow
    # 34m - Blue
    # 35m - Purple
    # 36m - Cyan
    # 37m - White
    # 0 - Normal
    # 1 - Bold
    local BLACK="\[\033[0;30m\]"
    local BLACKBOLD="\[\033[1;30m\]"
    local RED="\[\033[0;31m\]"
    local REDBOLD="\[\033[1;31m\]"
    local GREEN="\[\033[0;32m\]"
    local GREENBOLD="\[\033[1;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local YELLOWBOLD="\[\033[1;33m\]"
    local BLUE="\[\033[0;34m\]"
    local BLUEBOLD="\[\033[1;34m\]"
    local PURPLE="\[\033[0;35m\]"
    local PURPLEBOLD="\[\033[1;35m\]"
    local CYAN="\[\033[0;36m\]"
    local CYANBOLD="\[\033[1;36m\]"
    local WHITE="\[\033[0;37m\]"
    local WHITEBOLD="\[\033[1;37m\]"
    export PS1="$WHITEBOLD\[\e(0\]l\[\e(B\] $YELLOW\@$WHITEBOLD $WHITE[$RED\u$WHITE@$GREEN\h$WHITE]\$(__git_ps1) $CYAN\w\n$WHITEBOLD\[\e(0\]m\[\e(B\]$WHITEBOLD> $WHITE"
}
prompt
