# function to abbreviate path to PWD with PWD full name
export PROMPT_COMMAND='PS1X=$(p="${PWD#${HOME}}"; [ "${PWD}" != "${p}" ] && printf "~";IFS=/; for q in ${p:1}; do printf /${q:0:1}; done; printf "${q:1}")'

export PS1='${PS1X}:\e[0;96m$(__git_ps1 " [%s]")\e[m \$ '

# Deprecate warning
export BASH_SILENCE_DEPRECATION_WARNING=1

alias ll='ls -laG'
# show full tree for PWD
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# Git settings
export GIT_PS1_SHOWDIRTYSTATE=1
source ~/.git-prompt.sh
