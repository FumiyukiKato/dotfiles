# OPAM configuration
. /Users/fumiyuki/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# added by Anaconda3 5.0.1 installer
export PATH="/usr/local/anaconda3/bin:$PATH"
eval "$(rbenv init -)"

export PS1="\w $ "


HISTSIZE=5000
HISTFILESIZE=5000

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

source ~/.bashrc

export GOBIN=/Users/fumiyuki/go/bin
