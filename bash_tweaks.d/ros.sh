export ROS_MASTER_URI=http://localhost:11311
#export ROS_IP=172.22.182.158
#export ROS_MASTER_URI=http://172.22.148.92:11311
export ROSCONSOLE_FORMAT='[${severity}] [${time}] [${node}]: ${message}'
export ROSCONSOLE_CONFIG_FILE=~/.ros/rosconsole.cfg

# Source ROS workspaces
#source /home/bandera/repos/ros_catkin_ws/install/setup.bash
source /opt/ros/kinetic/setup.bash
