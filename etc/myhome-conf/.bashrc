alias rm="rm -i"
alias ll="ls -l"
alias cp="cp -i"
/usr/sbin/alsactl init 2&>> /dev/null

[[ -f /etc/profile.d/bash-completion.sh ]] && source /etc/profile.d/bash-completion.sh

PATH="/usr/sbin/:${PATH}"
export PATH
