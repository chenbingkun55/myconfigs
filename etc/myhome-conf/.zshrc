export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
export PS1="%B%F{white}[%*] %B%F{green}%n@%m%k %B%F{blue}%1~ \$ %b%f%k"

setopt hist_ignore_all_dups
setopt hist_ignore_space
