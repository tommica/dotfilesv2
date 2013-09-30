# SETTINGS                                                                     {{{
# --------------------------------------------------------------------------------
# Set TERM
set-option -g default-terminal "screen-256color"
set-option -g default-shell /bin/zsh

# Set terminal window title
set-option -g set-titles on
set-option -g set-titles-string '#S (#W)'

# Start indices on correct side of keyboard
set-option -g base-index 1

# Allow faster command sequences
set-option -s escape-time 0

# Use vi-like status and mode keys
set-option -g status-keys vi
set-option -g mode-keys vi

# Keep messages on screen longer
set-option -g display-time 2000

# Don't show a message for any activity type
set-option -g visual-activity off
set-option -g visual-content off
set-option -g visual-bell off

# Prefs for pre-defined layouts
set-window-option -g main-pane-height 60
set-window-option -g main-pane-width 180

# Aggressively resize windows
set-window-option -g aggressive-resize on

# Set window notifications
# Watch for activity in windows and highlight in status bar
set-window-option -g monitor-activity on

# }}}
# APPEARANCE                                                                   {{{
# --------------------------------------------------------------------------------
# Status bar
set-option -g status-left ' #S #[fg=brightyellow,bg=black]#(~/bin/org-clock-current-task.sh)'
set-option -g status-right '  %a #[fg=brightwhite]%H:%M #[fg=brightblack] %Y/%m/%d #[fg=green]#(osascript ~/bin/com_status.scpt) '

set-option -g status-left-attr bold
set-option -g status-left-fg black
set-option -g status-left-bg green

set-option -g status-right-fg brightblack
set-option -g status-right-bg black

set-option -g status-left-length 60
set-option -g status-right-length 60

set-window-option -g window-status-format ' (#I) #W '
set-window-option -g window-status-current-format ' (#I) #W '

set-window-option -g status-fg white
set-window-option -g status-bg brightblack

# Current window tab
set-window-option -g window-status-current-fg white
set-window-option -g window-status-current-bg black

# Window tab triggered by bell
set-window-option -g window-status-bell-fg red
set-window-option -g window-status-bell-bg white

# Window tab triggered by output
set-window-option -g window-status-activity-fg blue
set-window-option -g window-status-activity-bg white

# Window tab triggered by monitor-content command
set-window-option -g window-status-content-fg green
set-window-option -g window-status-content-bg white

set-window-option -g mode-fg black
set-window-option -g mode-bg brightblue

set-option -g pane-border-fg black
set-option -g pane-active-border-fg brightblack

set-option -g message-fg white
set-option -g message-bg red

# }}}
# vim: foldmethod=marker

