# Setup fzf
# ---------
if [[ ! "$PATH" == */home/bstadlbauer/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/bstadlbauer/.fzf/bin"
fi

source <(fzf --zsh)
