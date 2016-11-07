alias docker_rmi_all='docker rmi $(docker images -q)'
alias docker_rm_all='docker rm $(docker ps -a -q)'
alias docker_stop_all='docker stop $(docker ps -a -q)'
