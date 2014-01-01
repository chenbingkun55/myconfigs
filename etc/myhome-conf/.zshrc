export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
export PS1="%B%F{white}[%*] %B%F{green}%n@%m%k %B%F{blue}%1~ \$ %b%f%k"

#setopt hist_ignore_all_dups
setopt hist_ignore_space

[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric compdef pkill=kill compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'
# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

# 别名
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -F --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'
alias ee='emacsclient -t'

# 键绑定
case $TERM in
    xterm*)
    bindkey "^[[F" end-of-line
    bindkey "^[[H" beginning-of-line 
    break
    ;;
    linux*)
    bindkey "^[[F" end-of-line
    bindkey "^[[H" beginning-of-line 
    alias fbterm='LANG=zh_CN.UTF-8 fbterm'
    fbterm && tmux
    break
    ;;
esac
    bindkey '\e[1~' beginning-of-line       # Home
    bindkey '\e[4~' end-of-line             # End
    bindkey '\e[3~' delete-char             # Del
    bindkey '\e[2~' overwrite-mode          # Insert 
    bindkey -v

# 添加 ssh-add key
[ -f ~/.ssh/Bzbee_SSH_Key ] && keychain ~/.ssh/Bzbee_SSH_Key
[ -f ~/.ssh/id_dsa ] && keychain ~/.ssh/id_dsa
