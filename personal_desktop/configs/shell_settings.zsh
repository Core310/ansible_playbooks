# Quick config/reload
alias settings="nano ~/.zshrc"
alias reload="source ~/.zshrc"

# ls aliases
alias l="ls -lah"
alias ls="ls --color=auto"
alias la="ls -a"

# tmux helpers
alias tma="tmux attach -t"
alias tmn="tmux new -t"

# pokemon-colorscripts
if command -v pokemon-colorscripts > /dev/null 2>&1; then
    pokemon-colorscripts --random
fi
