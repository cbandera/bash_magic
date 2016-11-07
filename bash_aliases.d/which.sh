function catw(){ cat $(which $1); }
function llw(){ ll $(which $1); }
function cdw(){
if [ ! -z "$1" ]; then
	FILE=$(which $1);
	if [ -z $FILE ]; then
		FILE=$1;
	fi
	if [ -h $FILE ]; then
		FILE=$(readlink -f $FILE);
	fi
	DIR=$(dirname $FILE);
	cd $DIR;
fi
}
function nanow(){ nano $(which $1); }

