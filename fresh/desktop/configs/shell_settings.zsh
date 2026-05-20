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
alias ls='ls --color=auto'

# tmux helpers
alias tma='tmux attach -t'
alias tmn='tmux new -t'

# Path exports
export PATH="/usr/local/cuda-13.0/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-13.0/lib64:$LD_LIBRARY_PATH"
export UE4_ROOT=~/UnrealEngine_4.26
