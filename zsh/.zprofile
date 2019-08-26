#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='emacs'
export VISUAL='emacs'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
# OPAM configuration
. /Users/fumiyuki/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# added by Anaconda3 5.0.1 installer
export PATH="/usr/local/anaconda3/bin:$PATH"
eval "$(rbenv init -)"
eval "$(plenv init -)"

export PS1="\w $ "

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fumiyuki/google-cloud-sdk/path.bash.inc' ]; then source '/Users/fumiyuki/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fumiyuki/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/fumiyuki/google-cloud-sdk/completion.bash.inc'; fi


HISTSIZE=100000
HISTFILESIZE=100000

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export GOBIN=/Users/fumiyuki/go/bin

