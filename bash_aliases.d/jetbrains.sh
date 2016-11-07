#Update clion
update_clion() {
	# Download package
	#firefox https://www.jetbrains.com/clion/download/download-thanks.html?platform=linux
	echo "Getting folder name"
	folder_name=$(tar -ztf $1 | head -1 | grep -o '^[^/]*')
	rm -rf $folder_name
	echo "Extracting $1"
	tar -xvzf $1 1>/dev/null
	echo "Installing $folder_name to /opt"
	inst2opt $folder_name
	echo "Adjusting launcher"
	sudo sed -ie "s:/opt/[^/]*/bin:/opt/$folder_name/bin:g" /usr/share/applications/jetbrains-clion.desktop
	echo "Deleting old files"
	for D in $(find /opt -mindepth 1 -maxdepth 1 -type d -name clion*)
	do
		if [ $(basename $D) != $folder_name ]; then
			echo "Deleting old version $D"
			sudo rm -rf $D
		fi;
	done;
	rm -rf $folder_name
	rm -rf $1
}

#Update pycharm
update_pycharm() {
	# Download package
	#firefox https://www.jetbrains.com/pycharm/download/download-thanks.html?platform=linux
	echo "Getting folder name"
	folder_name=$(tar -ztf $1 | head -1 | grep -o '^[^/]*')
	rm -rf $folder_name
	echo "Extracting $1"
	tar -xvzf $1 1>/dev/null
  echo "Installing $folder_name to /opt"
	inst2opt $folder_name
	echo "Adjusting launcher"
	sudo sed -ie "s:/opt/[^/]*/bin:/opt/$folder_name/bin:g" /home/claudio/.local/share/applications/jetbrains-pycharm.desktop
	echo "Deleting old files"
	for D in $(find /opt -mindepth 1 -maxdepth 1 -type d -name "pycharm*")
	do
		if [ $(basename $D) != $folder_name ]; then
			echo "Deleting old version $D"
			sudo rm -rf $D
		fi;
	done;
	rm -rf $folder_name
	rm -rf $1
}

