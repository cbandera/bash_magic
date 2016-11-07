alias n='nautilus .'

# Find top 5 big files
alias findbig="find . -type f -exec ls -s {} \; | sort -n -r | head -5"
alias dus='sudo du --block-size=MiB --max-depth=1 | sort -n'

# Clear the screen and list file
alias cls='clear;ls'

# To navigate to the different directories
alias ..='cd ..'
alias ...='cd ../..'

alias ll='ls -lah'

alias open='xdg-open'

alias rs='rsync -r -u -h --progress --links'
alias gvfs_fix='sudo umount ~/.gvfs && sudo rm -rf ~/.gvfs'

#function rm() {
#  TRASH="~/.trash/$(date +%Y-%m-%d)/"
#  mkdir -p $TRASH
#  while [ "$#" -gt 0 ]; do
#    if [ "$1" != "-*"]; do
#      echo "Moving $1 to $TRASH"
#      mv "$1" $TRASH
#    done
#  done
#}

function up( )
{
if [ "$#" -gt 0 ]; then
	LIMIT=$1;
else
	LIMIT=1;
fi
P=$PWD
for ((i=1; i <= LIMIT; i++))
do
    P=$P/..
done
cd $P
export MPWD=$P
}

function bk( )
{
if [ "$#" -gt 0 ]; then
        LIMIT=$1;
else
        LIMIT=1;
fi
P=$MPWD
for ((i=1; i <= LIMIT; i++))
do
    P=${P%/..}
done
cd $P
export MPWD=$P
}

function cp_dtree(){
	# Copies a directory tree without files
	if [ "$#" -ne 2 ]; then
  	  echo "Usage: cp_dtree <source> <destination>"
	fi
	rsync -a -f"+ */" -f"- *" $1 $2
}

function mvblk(){
for FILE in `ls`; do
	NEWNAME=${FILE/$1/$2};
	if [ ! $NEWNAME == $FILE ]; then
		echo "Moving $FILE to $NEWNAME";
		mv $FILE $NEWNAME;
	fi;
done;
}

function sedblk(){
for FILE in `ack -f`; do
	sed -i -e "s/$1/$2/g" $FILE;
done
}

# Move folder to /opt adjust owner rights
inst2opt() {
	sudo cp -av --no-preserve=owner $1 /opt/ 1>/dev/null
	sudo rm -rf $1*
}