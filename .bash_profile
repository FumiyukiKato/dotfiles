# OPAM configuration
. /Users/fumiyuki/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# added by Anaconda3 5.0.1 installer
export PATH="/usr/local/anaconda3/bin:$PATH"
eval "$(rbenv init -)"

export PS1="\w $ "

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fumiyuki/google-cloud-sdk/path.bash.inc' ]; then source '/Users/fumiyuki/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fumiyuki/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/fumiyuki/google-cloud-sdk/completion.bash.inc'; fi


HISTSIZE=5000
HISTFILESIZE=5000

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

source ~/.bashrc

export GOBIN=/Users/fumiyuki/go/bin
