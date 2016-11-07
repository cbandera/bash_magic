function psgrep() {
	ps -p $(pgrep $@)
}
alias psg="ps aux | awk '{print \$2,\$11}' | grep"
