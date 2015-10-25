#!/usr/bin/env bash

################################################################################
# Setting new "default" tmux bindings
################################################################################

# First unbind *default* keybindings except for prefix
tmux source-file $CURRENT_DIR/.tmux.unbind.conf

#####################################################
# Generic Commands

# Now reinsert all the regular tmux keys with the -n flag for no prefix.
tmux bind -n          M-? list-keys # HELP! Keyboard-Shorcuts
tmux bind -n          M-: command-prompt

#####################################################
# Client commands

tmux bind -n          M-z suspend-client
tmux bind -n          M-D choose-client
tmux bind -n          M-L switch-client -l
tmux bind -n          M-r refresh-client

#####################################################
# Window Commands: EG. Tmux Tabs

tmux bind -n          M-o rotate-window
tmux bind -n          M-c new-window
tmux bind -n          M-, command-prompt -I "#W" "rename-window '%%'"
tmux bind -n          M-l last-window
tmux bind -n          M-n next-window
tmux bind -n        M-C-n next-window -a
tmux bind -n          M-p previous-window
tmux bind -n        M-C-p previous-window -a
tmux bind -n        M-"'" command-prompt -p index "select-window -t ':%%'"
tmux bind -n          M-f command-prompt "find-window '%%'"
tmux bind -n          M-w choose-window
tmux bind -n          M-0 select-window -t :0
tmux bind -n          M-1 select-window -t :1
tmux bind -n          M-2 select-window -t :2
tmux bind -n          M-3 select-window -t :3
tmux bind -n          M-4 select-window -t :4
tmux bind -n          M-5 select-window -t :5
tmux bind -n          M-6 select-window -t :6
tmux bind -n          M-7 select-window -t :7
tmux bind -n          M-8 select-window -t :8
tmux bind -n          M-9 select-window -t :9
tmux bind -n          M-. command-prompt "move-window -t '%%'"

#####################################################
# Pane Commands: EG. Splits

tmux bind -n          M-! break-pane # Moves current pane to new window.
tmux bind -n          M-x confirm-before -p "kill-pane #P? (y/n)" kill-pane
tmux bind -n          M-& confirm-before -p "kill-window #W? (y/n)" kill-window
tmux bind -n        M-'"' split-window
tmux bind -n          M-% split-window -h
tmux bind -n          M-o select-pane -t :.+
tmux bind -n          M-{ swap-pane -U
tmux bind -n          M-} swap-pane -D
tmux bind -n          M-z resize-pane -Z # Focus current pane.
tmux bind -n         M-Up select-pane -U
tmux bind -n       M-Down select-pane -D
tmux bind -n       M-Left select-pane -L
tmux bind -n      M-Right select-pane -R
tmux bind -n         M-\; last-pane
tmux bind -n       M-C-Up resize-pane -U
tmux bind -n     M-C-Down resize-pane -D
tmux bind -n     M-C-Left resize-pane -L
tmux bind -n    M-C-Right resize-pane -R
tmux bind -n        M-C-1 select-layout even-horizontal
tmux bind -n        M-C-2 select-layout even-vertical
tmux bind -n        M-C-3 select-layout main-horizontal
tmux bind -n        M-C-4 select-layout main-vertical
tmux bind -n        M-C-5 select-layout tiled
tmux bind -n      M-Space next-layout
tmux bind -n        M-C-o rotate-window -D
tmux bind -n          M-q display-panes

#####################################################
# Session Commands

tmux bind -n        M-'$' command-prompt -I "#S" "rename-session '%%'"
tmux bind -n        M-'(' switch-client -p # Move to previous session
tmux bind -n        M-')' switch-client -n # Move to next session
tmux bind -n          M-d detach-client

#####################################################
# Copy Mode Commands

tmux bind -n        M-'#' list-buffers
tmux bind -n          M-- delete-buffer
tmux bind -n          M-= choose-buffer
tmux bind -n          M-[ copy-mode
tmux bind -n          M-] paste-buffer

#####################################################
# Miscellaneous Bindings

tmux bind -n          M-t clock-mode
tmux bind -n        M-'~' show-messages
tmux bind -n          M-i display-message
tmux bind -n      M-PPage copy-mode -u
tmux bind -n          M-s choose-tree
