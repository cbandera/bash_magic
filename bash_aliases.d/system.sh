
# Install updates
updatesys() {
	sudo apt-get update;		alert;
	sudo apt-get upgrade -y;	alert;
	sudo apt-get dist-upgrade -y;	alert;
	sudo apt-get autoremove; 	alert;
}

# List all manually installed packages
alias listManuallyInstalledPackages="comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)"


