_ba_complete()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
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
