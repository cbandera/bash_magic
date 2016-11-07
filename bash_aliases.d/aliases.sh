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
alias be='nano ~/.bashrc'
alias ba='nano ~/.bash_aliases.d/aliases.sh'
