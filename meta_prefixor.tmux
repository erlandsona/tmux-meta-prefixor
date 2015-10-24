#!/usr/bin/env bash

################################################################################
# Setting new "default" tmux bindings
################################################################################

#####################################################
# Generic Commands
# First remove *all* keybindings
tmux unbind-key -a
# Now reinsert all the regular tmux keys with the -n flag for no prefix.
tmux set -g prefix M-Space # setup prefix key just in case.
tmux bind-key         M-Space send-prefix # C-b then C-b again to send C-b
tmux bind-key         C-l send-keys 'C-l' # Use C-a C-l to clear screen if something isn't right.
tmux bind-key -n      M-? list-keys # HELP! Keyboard-Shorcuts
tmux bind-key -n      M-: command-prompt

# Force reload of config file
tmux bind-key -n      M-r source-file ~/.tmux.conf \; display-message "Config reloaded..."

#####################################################
# Window Commands: EG. Tmux Tabs

tmux bind-key -n      M-c command-prompt -p "Name of new window: " "new-window -c '#{pane_current_path}' -n '%%'"
tmux bind-key -n      M-, command-prompt -I "#W" "rename-window '%%'"
tmux bind-key -n      M-n next-window
tmux bind-key -n      M-p previous-window
tmux bind-key -n      M-P swap-window -t -1
tmux bind-key -n      M-N swap-window -t +1
tmux bind-key -n   M-Left swap-window -t -1
tmux bind-key -n  M-Right swap-window -t +1
tmux bind-key -n      M-W confirm-before -p "kill-window #W? (y/n)" kill-window

#####################################################
# Pane Commands: EG. Splits

tmux bind-key -n      M-! break-pane # Moves current pane to new window.
tmux bind-key -n      M-w confirm-before -p "kill-pane #P? (y/n)" kill-pane
tmux bind-key -n      M-s split-window -v -c "#{pane_current_path}"
tmux bind-key -n      M-v split-window -h -c "#{pane_current_path}"
tmux bind-key -n      M-{ swap-pane -U
tmux bind-key -n      M-} swap-pane -D
tmux bind-key -n      M-z resize-pane -Z # Focus current pane.
# Vim-Tmux-Navigator for splits.
is_vim='echo "#{pane_current_command}" | grep -iqE "(^|\/)g?(view|n?vim?)(diff)?$"'
tmux bind-key -n      M-h if-shell "$is_vim" "send-keys M-h" "select-pane -L"
tmux bind-key -n      M-j if-shell "$is_vim" "send-keys M-j" "select-pane -D"
tmux bind-key -n      M-k if-shell "$is_vim" "send-keys M-k" "select-pane -U"
tmux bind-key -n      M-l if-shell "$is_vim" "send-keys M-l" "select-pane -R"
# bind-key -n      M-\ if-shell "$is_vim" "send-keys M-\\" "select-pane -l"
tmux bind-key -n      M-H resize-pane -L 2
tmux bind-key -n      M-J resize-pane -D 2
tmux bind-key -n      M-K resize-pane -U 2
tmux bind-key -n      M-L resize-pane -R 2
tmux bind-key -n      M-1 select-layout even-horizontal
tmux bind-key -n      M-2 select-layout even-vertical
tmux bind-key -n      M-3 select-layout main-horizontal
tmux bind-key -n      M-4 select-layout main-vertical
tmux bind-key -n      M-5 select-layout tiled
tmux bind-key -n      M-= select-layout tiled
tmux bind-key -n  M-Space next-layout

#####################################################
# Session Commands

tmux bind-key -n    M-'$' command-prompt -I "#S" "rename-session '%%'"
tmux bind-key -n    M-'(' switch-client -p # Move to previous session
tmux bind-key -n    M-')' switch-client -n # Move to next session
tmux bind-key -n      M-C run ~/.tmux/plugins/tmux-sessionist/scripts/new_session_prompt.sh
tmux bind-key -n      M-X run "~/.tmux/plugins/tmux-sessionist/scripts/kill_session_prompt.sh '#{session_name}' '#{session_id}'"
tmux bind-key -n      M-g run ~/.tmux/plugins/tmux-sessionist/scripts/goto_session.sh
# Redraw the client (if interrupted by wall, etc)
tmux bind-key -n      M-R refresh-client
tmux bind-key -n      M-d detach-client

#####################################################
# Copy Mode Commands

tmux bind-key -n      M-[ copy-mode
tmux bind-key -n      M-] paste-buffer

# Copy-paste integration
tmux set  -g default-command "reattach-to-user-namespace -l bash"
# Setup 'v' to begin selection as in Vim
tmux bind -t vi-copy v begin-selection
tmux bind -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"
# Update default binding of `Enter` to also use copy-pipe
tmux unbind -t vi-copy Enter
tmux bind -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"
tmux bind-key -n      M-q display-panes
tmux bind-key -n      M-t clock-mode
tmux bind-key -n    M-'~' show-messages
# bind-key -n  M-PPage copy-mode -u
# Move windows around easily

## Bind ']' to use pbpaste
##bind ] run "reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer"



################################################################################
# Uncomment if default tmux bindings are prefered.
################################################################################
# source-file ~/.tmux.reset.conf



################################################################################
################################################################################
################################################################################
################################################################################
##################### Begin other customizations.... ###########################
################################################################################
################################################################################
################################################################################
################################################################################



