#!/usr/bin/env bash

################################################################################
# Setting new "default" tmux bindings
################################################################################

#####################################################
# Generic Commands

# First unbind *default* keybindings
tmux source-file $CURRENT_DIR/.tmux.unbind.conf

# Now reinsert all the regular tmux keys with the -n flag for no prefix.
tmux bind -n          M-? list-keys # HELP! Keyboard-Shorcuts
tmux bind -n          M-: command-prompt

#####################################################
# Window Commands: EG. Tmux Tabs

tmux bind -n          M-c command-prompt -p "Name of new window: " "new-window -c '#{pane_current_path}' -n '%%'"
tmux bind -n          M-, command-prompt -I "#W" "rename-window '%%'"
tmux bind -n          M-n next-window
tmux bind -n          M-p previous-window
tmux bind -n          M-P swap-window -t -1
tmux bind -n          M-N swap-window -t +1
tmux bind -n       M-Left swap-window -t -1
tmux bind -n      M-Right swap-window -t +1
tmux bind -n          M-W confirm-before -p "kill-window #W? (y/n)" kill-window

#####################################################
# Pane Commands: EG. Splits

tmux bind -n          M-! break-pane # Moves current pane to new window.
tmux bind -n          M-w confirm-before -p "kill-pane #P? (y/n)" kill-pane
tmux bind -n          M-s split-window -v -c "#{pane_current_path}"
tmux bind -n          M-v split-window -h -c "#{pane_current_path}"
tmux bind -n          M-{ swap-pane -U
tmux bind -n          M-} swap-pane -D
tmux bind -n          M-z resize-pane -Z # Focus current pane.
# Vim-Tmux-Navigator for splits.
is_vim='echo "#{pane_current_command}" | grep -iqE "(^|\/)g?(view|n?vim?)(diff)?$"'
tmux bind -n          M-h if-shell "$is_vim" "send-keys M-h" "select-pane -L"
tmux bind -n          M-j if-shell "$is_vim" "send-keys M-j" "select-pane -D"
tmux bind -n          M-k if-shell "$is_vim" "send-keys M-k" "select-pane -U"
tmux bind -n          M-l if-shell "$is_vim" "send-keys M-l" "select-pane -R"
# tmux bind -n          M-\ if-shell "$is_vim" "send-keys M-\\" "select-pane -l"
tmux bind -n          M-H resize-pane -L 2
tmux bind -n          M-J resize-pane -D 2
tmux bind -n          M-K resize-pane -U 2
tmux bind -n          M-L resize-pane -R 2
tmux bind -n          M-1 select-layout even-horizontal
tmux bind -n          M-2 select-layout even-vertical
tmux bind -n          M-3 select-layout main-horizontal
tmux bind -n          M-4 select-layout main-vertical
tmux bind -n          M-5 select-layout tiled
tmux bind -n          M-= select-layout tiled
tmux bind -n      M-Space next-layout

#####################################################
# Session Commands

tmux bind -n        M-'$' command-prompt -I "#S" "rename-session '%%'"
tmux bind -n        M-'(' switch-client -p # Move to previous session
tmux bind -n        M-')' switch-client -n # Move to next session
tmux bind -n          M-C run ~/.tmux/plugins/tmux-sessionist/scripts/new_session_prompt.sh
tmux bind -n          M-X run "~/.tmux/plugins/tmux-sessionist/scripts/kill_session_prompt.sh '#{session_name}' '#{session_id}'"
tmux bind -n          M-g run ~/.tmux/plugins/tmux-sessionist/scripts/goto_session.sh
# Redraw the client (if interrupted by wall, etc)
tmux bind -n          M-R refresh-client
tmux bind -n          M-d detach-client

#####################################################
# Copy Mode Commands

tmux bind -n          M-[ copy-mode
tmux bind -n          M-] paste-buffer

# Update default binding of `Enter` to also use copy-pipe
tmux bind -n          M-q display-panes
tmux bind -n          M-t clock-mode
tmux bind -n        M-'~' show-messages
# tmux bind -n      M-PPage copy-mode -u
