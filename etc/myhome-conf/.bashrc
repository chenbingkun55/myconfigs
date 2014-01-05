#### ????Ч,???뿪?????Զ?????????,Ĭ??Ϊ????.
# /usr/sbin/alsactl init 2&>> /dev/null
###


[[ -f /etc/profile.d/bash-completion.sh ]] && source /etc/profile.d/bash-completion.sh

PS1='\[\033[01;32m\]\u@\h\[\033[01;37m\] \t\[\033[01;34m\] \w \$\[\033[00m\]'
PATH="/usr/sbin/:/home/chenbk/01_Shell/:${PATH}"
export PATH
export PROMPT_COMMAND="echo -ne '\a'"
export EDITOR="/usr/bin/vim"
export TERM=fbterm

#tty汉化
if [ "$TERM" = "linux" ]; then   #如果开启的是tty1~6
alias fbterm='LANG=zh_CN.UTF-8 fbterm'
#这里把fbterm声明成这样
#这样退出fbterm想再进入时，就可以直接打fbterm
#而不用手动再改LANG=zh_CN.UTF-8了
fbterm #运行fbterm
[[ -f "$TMUX" ]] && (tmux -2 -S $TMUX) || (TMUX="" tmux -2)  
#fcitx-fbterm-helper -l
#运行这句，输入法就能正常使用了
fi

alias rm="trash-put"
alias ll="ls -l"
