alias rm="rm -i"
alias ll="ls -l"
alias cp="cp -i"
#### 不生效,是想开机后自动打开声音,默认为静音.
# /usr/sbin/alsactl init 2&>> /dev/null
###


[[ -f /etc/profile.d/bash-completion.sh ]] && source /etc/profile.d/bash-completion.sh

PATH="/usr/sbin/:${PATH}"
export PATH
