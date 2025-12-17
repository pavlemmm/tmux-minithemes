#!/usr/bin/env bash

##### Helpers ###############################################################

tmux_get() {
  local value
  value="$(tmux show -gqv "$1")"
  [ -n "$value" ] && echo "$value" || echo "$2"
}

tmux_set() {
  tmux set-option -gq "$1" "$2"
}

##### Icons / Options #######################################################

rarrow=$(tmux_get @tmux_minithemes_right_arrow_icon '')
larrow=$(tmux_get @tmux_minithemes_left_arrow_icon '')
rseparator=$(tmux_get @tmux_minithemes_right_separator_icon '')
lseparator=$(tmux_get @tmux_minithemes_left_separator_icon '')
secondary_separator_modern=$(tmux_get @tmux_minithemes_secondary_separator_modern $rseparator)
secondary_separator_simple=$(tmux_get @tmux_minithemes_secondary_separator_simple '')

user_icon=$(tmux_get @tmux_minithemes_user_icon ' ')
folder_icon=$(tmux_get @tmux_minithemes_folder_icon ' ')
windows_icon=$(tmux_get @tmux_minithemes_windows_icon ' ')
panes_icon=$(tmux_get @tmux_minithemes_panes_icon '󰝘 ')

theme=$(tmux_get @tmux_minithemes_theme 'tokyonight')
style=$(tmux_get @tmux_minithemes_style 'simple')

##### Themes ###############################################################

case "$theme" in
  tokyonight)
    TC="#7aa2f7"; SC="#ff9e64"
    G0="#1a1b26"; G1="#24283b"; G2="#414868"; G3="#565f89"; G4="#6c6f93"
    ;;
  gold)
    TC="#ffb86c"; SC="#ff79c6"
    G0="#262626"; G1="#303030"; G2="#3a3a3a"; G3="#444444"; G4="#626262"
    ;;
  everforest)
    TC="#a7c080"; SC="#d3869b"
    G0="#2b3339"; G1="#323c41"; G2="#3a464c"; G3="#859289"; G4="#9da9a0"
    ;;
  gruvbox)
    TC="#fabd2f"; SC="#fb4934"
    G0="#282828"; G1="#32302f"; G2="#3c3836"; G3="#665c54"; G4="#928374"
    ;;
  catppuccin)
    TC="#89b4fa"; SC="#f5a97f"
    G0="#1e1e2e"; G1="#262637"; G2="#313244"; G3="#585b70"; G4="#a6adc8"
    ;;
  nord)
    TC="#88c0d0"; SC="#81a1c1"
    G0="#2e3440"; G1="#3b4252"; G2="#434c5e"; G3="#4c566a"; G4="#d8dee9"
    ;;
  dracula)
    TC="#bd93f9"; SC="#ff79c6"
    G0="#282a36"; G1="#343746"; G2="#44475a"; G3="#6272a4"; G4="#f8f8f2"
    ;;
  onedark)
    TC="#61afef"; SC="#e06c75"
    G0="#1e2127"; G1="#282c34"; G2="#3e4451"; G3="#5c6370"; G4="#abb2bf"
    ;;
  rosepine)
    TC="#f6c177"; SC="#eb6f92"
    G0="#191724"; G1="#26233a"; G2="#555169"; G3="#6e6a86"; G4="#908caa"
    ;;
  *)
    theme="tokyonight"
    TC="#7aa2f7"; SC="#ff9e64"
    G0="#1a1b26"; G1="#24283b"; G2="#414868"; G3="#565f89"; G4="#6c6f93"
    ;;
esac

##### Layout-dependent ######################################################

if [ "$style" = "simple" ]; then
  STATUS_BG="$G0"
  SECONDARY_BG="$G1"
  SECONDARY_SEPARATOR="$secondary_separator_simple"
else
  STATUS_BG="$G0"
  SECONDARY_BG="$G2"
  SECONDARY_SEPARATOR="$secondary_separator_modern"
fi

##### Status Base ###########################################################

tmux_set status on
tmux_set status-interval 1

tmux_set status-bg "$STATUS_BG"
tmux_set status-left-bg "$STATUS_BG"
tmux_set status-right-bg "$STATUS_BG"

tmux_set status-fg "$G4"
tmux_set status-attr none
tmux_set status-left-length 150
tmux_set status-right-length 150

##### Window Status #########################################################

if [ "$style" = "simple" ]; then
  tmux_set window-status-format         "#[fg=$G4,bg=$G0]  #I: #W #F  #[fg=$G4,bg=$G0]$rseparator"
  tmux_set window-status-current-format "#[fg=#{?client_prefix,$SC,$TC},bg=$G0,bold]  #I: #W #F  #[fg=$G4,bg=$G0,nobold]$rseparator"
else
  tmux_set window-status-format         "#[fg=$G0,bg=$G1]$rarrow#[fg=$G4,bg=$G1] #I #[fg=$G4,bg=$G1]$rseparator#[fg=$G4,bg=$G1] #W #F #[fg=$G1,bg=$G0]$rarrow"
  tmux_set window-status-current-format "#[fg=$G0,bg=#{?client_prefix,$SC,$TC}]$rarrow#[bold] #I #[nobold]$rseparator#[bold] #W #F #[fg=#{?client_prefix,$SC,$TC},bg=$G0,nobold]$rarrow"
fi

tmux_set window-status-separator ""

##### Status Left ###########################################################

LS_PART1="#[fg=$G0,bg=#{?client_prefix,$SC,$TC},bold] #S #[fg=#{?client_prefix,$SC,$TC},bg=$SECONDARY_BG,nobold]$rarrow"
LS_PART2="#[fg=#{?client_prefix,$SC,$TC},bg=$SECONDARY_BG] $windows_icon#{session_windows} $SECONDARY_SEPARATOR $panes_icon#{window_panes} #[fg=$SECONDARY_BG,bg=$G0]$rarrow"

tmux_set status-left "$LS_PART1$LS_PART2"

##### Status Right ##########################################################

RS_PART1="#[fg=$SECONDARY_BG]$larrow#[fg=#{?client_prefix,$SC,$TC},bg=$SECONDARY_BG] $folder_icon#(echo #{pane_current_path} | sed \"s|$HOME|~|\") "
RS_PART2="#[fg=#{?client_prefix,$SC,$TC},bg=$SECONDARY_BG]$larrow#[fg=$G0,bg=#{?client_prefix,$SC,$TC},bold] $user_icon$(whoami)@#h "

tmux_set status-right "$RS_PART1$RS_PART2"

##### Misc #################################################################

# Pane border
tmux_set pane-border-style "fg=$G3"
# Active pane border
tmux_set pane-active-border-style "fg=$TC"

# Pane number indicator
tmux_set display-panes-colour "$G3"
tmux_set display-panes-active-colour "$TC"

# Clock mode
tmux_set clock-mode-colour "$TC"
tmux_set clock-mode-style 24

# Message
tmux_set message-style "fg=$TC,bg=$G0"
# Command message
tmux_set message-command-style "fg=$TC,bg=$G0"

# Copy mode highlight
tmux_set mode-style "bg=$TC,fg=$G4"
