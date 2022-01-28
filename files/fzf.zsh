if [ -d /opt/homebrew/opt/fzf ]; then
  OPT_DIR="/opt/homebrew/opt/fzf"
else
  OPT_DIR="/usr/local/opt/fzf"
fi

# Setup fzf
# ---------
if [[ ! "$PATH" == *$OPT_DIR/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$OPT_DIR/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$OPT_DIR/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$OPT_DIR/shell/key-bindings.zsh"
