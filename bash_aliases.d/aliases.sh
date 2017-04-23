# Function which adds an alias to the current shell and to
# the ~/.bash_aliases file.

add_alias () {
	local name=$1 value="$2" DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	echo alias $name=\'$value\' >> $DIR/../bash_aliases.d/aliases.sh
	eval alias $name=\'$value\'
	alias $name
}

alias restart_networking='sudo ifdown eth0 && sudo ifup eth0'
alias restartnetw='sudo service network-manager restart'
alias ecl='bash -i -c "eclipse -vmargs -Xms2048m -Xmx8192m -XX:+UseParallelGC -XX:PermSize=2048M -XX:MaxPermSize=4096M"'
alias agi='sudo apt-get install'

alias rl='roslaunch'
alias bld='mrt catkin build -w'
alias uc='mrt maintenance credentials update_cache'


# Editing Bashrc
bs() { echo "Sourcing ~/.bash_rc" && . ~/.bashrc; }
alias be='$EDITOR ~/.bashrc'
ba() {
	if [ ! "$@" -gt "1" ]; then
		$EDITOR ~/.bash_aliases.d/aliases.sh
	else
		BM_ROOT_DIR=$( cd "$(readlink -f $( dirname "${BASH_SOURCE[0]}" ))/.." && pwd );
    	$EDITOR ${BM_ROOT_DIR}/bash_${1}.d/${2}.sh
	fi
}

_ba_complete()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    BM_ROOT_DIR=$( cd "$(readlink -f $( dirname "${BASH_SOURCE[0]}" ))/.." && pwd );
    if [ "$COMP_CWORD" == "1" ]; then
		BM_OPT_DIRS=$(find $BM_ROOT_DIR -maxdepth 1 -type d -name "bash_*.d" | grep -o "[^/]*\.d" | grep -o "_[a-z]*\." |grep -o "[a-z]*" )
		opts=$BM_OPT_DIRS
	elif [ "$COMP_CWORD" == "2" ]; then
		BM_OPT_FILES=$(find ${BM_ROOT_DIR}/bash_${prev}.d/ -type f -name "*.sh" | grep -o "[^/]*\.sh" | grep -o "^[^\.]*")
		opts=$BM_OPT_FILES
	fi
#	echo
#	echo "COMP_WORDS: $COMP_WORDS"
#	echo "COMP_CWORD: $COMP_CWORD"
#	echo "cur: $cur"
#	echo "prev: $prev"
#	echo "opts: $opts"
	

	COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}

complete -F _ba_complete ba
