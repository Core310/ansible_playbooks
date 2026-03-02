# ROS 2 aliases
alias vf="ros2 run tf2_tools view_frames"

# ROS 2 helpers
alias r2="ros2"
alias src="source install/setup.sh"
alias tlist="r2 topic list"
alias tinfo="r2 topic info"
alias techo="r2 topic echo"

# Colcon build helpers
alias cbf="colcon build --parallel-workers $(nproc) --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release"

# Cleanup (ROS build folders)
alias clean="rm -rf build/ install/ log/"

# global source
if [ -f /opt/ros/jazzy/setup.zsh ]; then
  source /opt/ros/jazzy/setup.zsh
fi
