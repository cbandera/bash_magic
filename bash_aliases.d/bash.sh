# turn xv on/off
xv() { case $- in *[xv]*) set +xv;; *) set -xv ;; esac }

