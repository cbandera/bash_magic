# Taken from https://jorge.fbarr.net/2011/03/24/making-your-bash-history-more-efficient/

# Histr
export HH_CONFIG=hicolor         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
export HISTTIMEFORMAT="%h %d %H:%M:%S> " # Format timestring nicely
#export HISTCONTROL=ignoredups   # Ignore duplicate entries if entered in a row
#export HISTCONTROL=ignorespace  # leading space hides commands from history
export HISTCONTROL=ignoreboth    # Ignore dubs and spaces
#export HISTCONTROL=erasedups    # Remove previous duplicates
export HISTIGNORE="open ._inst*" # Define which commands to ignore

# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi

