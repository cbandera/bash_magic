# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH=$PATH:$HOME/.local/bin

function _bm_root_dir() {
	echo $( cd "$(dirname $(readlink -f "${BASH_SOURCE[0]}"))" && pwd );
}
export BM_ROOT_DIR=$(_bm_root_dir)

function include_d {
	dir=${BM_ROOT_DIR}/${1}.d
	if [ -d $dir -a -r $dir -a -x $dir ]; then
		for i in $dir/*.sh; do
			 . $i
		done
	fi
}


include_d bash_tweaks
include_d bash_aliases
include_d bash_completion
