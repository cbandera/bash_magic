#!/bin/bash
BM_ROOT_DIR=$(readlink -f $(dirname $0))

# Make backup of original bashrc
if [ -e ~/.bashrc ]; then
	mv ~/.bashrc $BM_ROOT_DIR/bashrc_bak;
fi

# Create symlinks
rm -f  ~/.bashrc && ln -s ${BM_ROOT_DIR}/bashrc ~/.bashrc
