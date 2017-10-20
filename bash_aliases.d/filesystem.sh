alias n='nautilus .'

# Find top 5 big files
alias findbig="find . -type f -exec ls -s {} \; | sort -n -r | head -5"
alias dus='du --block-size=MiB --max-depth=1 | sort -n'

# Clear the screen and list file
alias cls='clear;ls'

# To navigate to the different directories
alias ..='cd ..'
alias ...='cd ../..'

alias ll='ls -lah'

alias open='xdg-open'

alias rs='rsync -r -u -h --progress --links'
alias gvfs_fix='sudo umount ~/.gvfs && sudo rm -rf ~/.gvfs'

alias dfl='df -lhT -t ext4'

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


# cd up in the directory tree until specified directory (e.g. 'up home')
upto ()
{
    if [ -z "$1" ]; then
        return
    fi
    local upto=$1
    cd "${PWD/\/$upto\/*//$upto}"
}


# This function is responsible for bash autocompletion
_upto()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    local d=${PWD//\//\ }
    COMPREPLY=( $( compgen -W "$d" -- "$cur" ) )
}
complete -F _upto upto

# jump down until specified directory. Will jump to first match.
jd(){
    if [ -z "$1" ]; then
        echo "Usage: jd [directory]";
        return 1
    else
        cd **"/$1"
    fi
}
shopt -s globstar

# Change directories by the specified number of dirs. (e.g. 'up 2' == 'cd ../..')
function up {
ups=""
for i in $(seq 1 $1)
do
        ups=$ups"../"
done
cd $ups
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
for FILE in `ack -l $1`; do
	sed -i -e "s/$1/$2/g" $FILE;
done
}

# Move folder to /opt adjust owner rights
inst2opt() {
	sudo cp -av --no-preserve=owner $1 /opt/ 1>/dev/null
	sudo rm -rf $1*
}
