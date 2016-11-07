
# Install updates
updatesys() {
	sudo apt-get update;		alert;
	sudo apt-get upgrade -y;	alert;
	sudo apt-get dist-upgrade -y;	alert;
	sudo apt-get autoremove; 	alert;
}
