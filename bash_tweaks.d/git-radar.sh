export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w$(git-radar --bash --fetch) \[\033[01;34m\]\$\[\033[00m\] '
export GIT_PS1_SHOWDIRTYSTATE=1
export PATH=$PATH:$HOME/Documents/repos/GitHub/git-radar
