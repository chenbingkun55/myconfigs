# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export LUA_PATH="./?.lua;./?.lc;/usr/local/?/init.lua"

# 别名
alias cp='cp -i'
alias mv='mv -i'
alias nvim='nvim -u ~/.vim/vimrc'
alias rm='trash-put'
alias ls='ls -F --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'
alias ee='emacsclient -t'
alias ranger='ranger --confdir=~/.config/ranger'
setopt hist_ignore_space
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fino-time"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(osx autojump git bundler lighthouse vim-interaction pyenv)

# User configuration

#export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="${PATH}:/opt/FlashTool:~/01_Shell:/usr/sbin/:/usr/lib/ccache/bin:/usr/lib/distcc/bin:/usr/games/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
 export LANG=zh_CN.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_dsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

#export PS1="%B%F{black}[%*] %B%F{green}%n@%m%k %B%F{blue}%1~ \$ %b%f%k"
#export RPS1="%B%F{black}[%*]"
# 键绑定
#case $TERM in
#   xterm*)
#   bindkey "^[[F" end-of-line
#   bindkey "^[[H" beginning-of-line
#   ;;
#   screen*)
#   export TERM='xterm'
#   ;;
#   linux*)
#   export TERM='fbterm'
#   bindkey "^[[F" end-of-line
#   bindkey "^[[H" beginning-of-line
#   alias fbterm='LANG=zh_CN.UTF-8 fbterm'
#   #fbterm -- tmux
#   fbterm
#   ;;
#esa
#   bindkey '\e[1~' beginning-of-line       # Home
#   bindkey '\e[4~' end-of-line             # End
#   bindkey '\e[3~' delete-char             # Del
#   bindkey '\e[2~' overwrite-mode          # Insert
#
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && . ~/.autojump/etc/profile.d/autojump.zsh
#[[ -s ~/.powerline/powerline/bindings/zsh/powerline.zsh ]] && . ~/.powerline/powerline/bindings/zsh/powerline.zsh
