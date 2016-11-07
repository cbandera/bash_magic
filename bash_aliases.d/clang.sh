function rclang() {
	# Activate globstar for recursive globbing
	shopt -s globstar;
	# Reformat all code files
	clang-format-3.8 -i --style=file **/*.cpp **/*.h **/*.hpp **/*.hh **/*.cc;
	# Deactivate globstar
	shopt -u globstar;
}
