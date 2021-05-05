alias em="emacs"
alias ls='ls -FG'

## historysize
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

## Prompt
autoload colors
colors
PROMPT='%{${fg[cyan]}%}[%~] %W %T%{${reset_color}%}
$ '

## Git branch
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{green}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{blue}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

## functions

# cdls
function cdls() {
    cd "$@" && ls
}
alias cd='cdls'

function cdh() {
	local res=$(z | sort -rn | cut -c 12- | fzf)
	cd $res
}

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

# https://github.com/rupa/z
. /usr/local/bin/z

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# java (openjdk 15 via homebrew)
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"

# wake up ssh-agent 
eval "$(ssh-agent -s)"

# add sbin to PATH
export PATH="/usr/local/sbin:$PATH"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

tmux
tmux ls
