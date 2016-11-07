# Find files
myfind() {
    find ./ -name "*$2*" -type "$1" | tee /tmp/my_ffound | cat -n
    FFOUND_PWD=${PWD}
    FFOUND=($(cat /tmp/my_ffound))
}
ff() { myfind "f" "$1"; }
fd() { myfind "d" "$1"; }
fn() {
    [ ! -z ${FFOUND[$1-1]} ] && echo ${FFOUND_PWD}/${FFOUND[$1-1]};
}
e() { nano $(fn "$1");  }
c() { cd $(dirname $(fn "$1")); }
lf() { echo ${FFOUND[*]} | tr -s ' ' '\n' | cat -n; }

