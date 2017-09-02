export PATH="$HOME/d/p/bin:$PATH"

[[ -f "$HOME"/dotfile/.Xmodmap ]] && xmodmap "$HOME"/dotfile/.Xmodmap

if [[ -n "$TMUX" ]] && [[ -z "${MY_LOGGING_TMUX:-}" ]]; then
   export MY_LOGGING_TMUX="$$"
   logging_tmux_dir="$HOME/d/log/tmux"
   mkdir -p "$logging_tmux_dir"
   logging_tmux_base="$(date +%y%m%d%H%M%S)_$$_#I_#P_$(echo "$PWD" | sed -e 's|/|!|g').log"
   tmux pipe-pane "cat > \"${logging_tmux_dir}/${logging_tmux_base}\""
fi
