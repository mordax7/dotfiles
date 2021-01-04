# Use hybrid key bindings
fish_hybrid_key_bindings

# Enable direnv
eval (direnv hook fish)

# https://github.com/junegunn/fzf#layout
set -x FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
# https://github.com/junegunn/fzf#respecting-gitignore
set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
