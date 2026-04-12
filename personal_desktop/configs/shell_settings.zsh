# ROS 2 environment
source /opt/ros/jazzy/setup.zsh

# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnosterzak"
plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# Display Pokemon-colorscripts with fastfetch
if command -v pokemon-colorscripts > /dev/null 2>&1 && command -v fastfetch > /dev/null 2>&1; then
    pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -
fi

# General Aliases
alias settings='nano ~/.zshrc'
alias l='ls'
alias ls='ls -a --color=auto'

# ROS 2 helpers
alias r2="ros2"
alias src="source install/setup.sh"
alias tlist="r2 topic list"
alias tinfo="r2 topic info"
alias techo="r2 topic echo"
alias vf="ros2 run tf2_tools view_frames"

# Colcon build helpers
alias cbf="colcon build --parallel-workers $(nproc) --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release"
alias clean="rm -rf build/ install/ log/"

# tmux helpers
alias tma="tmux attach -t"
alias tmn="tmux new -t"

# Path exports
export PATH="/usr/local/cuda-13.0/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-13.0/lib64:$LD_LIBRARY_PATH"
export UE4_ROOT=~/UnrealEngine_4.26
