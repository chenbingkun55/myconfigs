alias rm="rm -i"
alias ll="ls -l"
#### ????Ч,???뿪?????Զ?????????,Ĭ??Ϊ????.
# /usr/sbin/alsactl init 2&>> /dev/null
###


[[ -f /etc/profile.d/bash-completion.sh ]] && source /etc/profile.d/bash-completion.sh

#PS1='[\u@\h \w \t] \$ '
PATH="/usr/sbin/:/home/chenbk/01_Shell/:${PATH}"
export PATH
export PROMPT_COMMAND="echo -ne '\a'"
export EDITOR="/usr/bin/vim"
