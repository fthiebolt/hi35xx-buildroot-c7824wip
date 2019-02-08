
# Source local definitions                                                                                                                                                                          
if [ -f ~/.env ]; then
    source ~/.env
fi

# User specific aliases and functions
alias rm='rm -i'
#alias cp='cp -i'
alias mv='mv -i'

alias l='ls --color -hlsv'
alias ll='ls --color -ahlsv'
alias la="ls --color -la"
#alias rm='rm -i'
#alias cp='cp -i'
#alias a2ps="a2ps -q -r -2 -T 3 -A fill "
#alias mpage="mpage -2 -P -c -m0 -s4 "
alias h=history
alias cls=clear
alias df="df -h"
#alias fm="sync && sysctl -w vm.drop_caches=3; free -g"
alias iotop="iotop -o -P -d 3"
#alias top="htop"
alias dtop="dstat --top-io-adv --top-bio-adv -d"
#alias svclist="systemctl list-unit-files --type=service"
#alias dmesg="dmesg -T"
alias netcon="lsof -i -n"
alias tailf="tail -f"

# commands history
export HISTSIZE=10000
export HISTTIMEFORMAT="%d-%h-%Y - %H:%M:%S "
export HISTCONTROL=erasedups
#shopt -s histappend

# My beautifull prompt :)
if [ "X${TERM}" != "Xvt100" ]; then
    export PS1="\[\e[7m\]\u@\h\[\e[m\][\W] "
else
    export PS1="[\u@\h][\W] "
fi

# set Timezone
export TZ="CET-1"

