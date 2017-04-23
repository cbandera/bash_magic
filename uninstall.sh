#!/bin/bash
BM_ROOT_DIR=$(readlink -f $(dirname $0))

# Replace with original backup of bashrc
rm -f ~/.bashrc
if [ -e $BM_ROOT_DIR/bashrc_bak ]; then
	mv $BM_ROOT_DIR/bashrc_bak ~/.bashrc;
else
	cp /etc/skel/.bashrc ~/.bashrc
fi