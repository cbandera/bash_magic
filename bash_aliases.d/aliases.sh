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
bs() { echo "Sourcing ~/.bashrc" && source ~/.bashrc; }
be() { $EDITOR $BM_ROOT_DIR; }
ba() {
	if [ "$#" -eq "0" ]; then
		$EDITOR ${BM_ROOT_DIR}/bash_aliases.d/aliases.sh
	else
		filename=${BM_ROOT_DIR}/bash_${1}.d/${2}.sh
		if [ -e $filename ]; then
			$EDITOR $filename
		else
			echo "File does not exist: $filename"
		fi
	fi
}
