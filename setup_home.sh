#! /bin/sh


sudo apt-get install -y build-essential tmux git vim curl zsh gparted

mkdir Projects && sudo wget -O - https://github.com/sunnyraj/vimrc/raw/master/autoinstall.sh | sh

curl -L http://install.ohmyz.sh | sh

##Adding aliases:

touch .zsh_aliases

echo "

alias nimbus="ssh -X sundarcs@nimbus.seas.gwu.edu"


## Colorize the ls output
alias ls='ls --color=auto'

## Use a long listing format ##
alias ll='ls -la'

## Show hidden files ##
alias l.='ls -d .* --color=auto'

" >> .zsh_aliases

# Load the alias file
echo ". ~/.zsh_aliases" >> .zshrc

## Make zsh your default shell. Do not use sudo

chsh -s /bin/zsh

##Install grub customizer

sudo apt-get install -y software-properties-common python-software-properties && sudo add-apt-repository ppa:danielrichter2007/grub-customizer && sudo apt-get update && sudo apt-get install -y grub-customizer

##Setup tmux configuration

touch .tmux.conf

echo "

# Change prefix key bindings
## set -g prefix C-a
set -g prefix `                   # use tilde key as prefix
bind `     send-key `             # insert tilde by pressing twice
unbind C-b

# Reload conf file
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# Split panes
bind \ split-window -h
bind - split-window -v

# Handle the mouse
setw -g mode-mouse on
set -g mouse-select-pane on
set -g mouse-resize-pane on
set -g mouse-select-window on

# Configure colors
set -g default-terminal "screen-256color"

# Configure status bar items
set -g status-left-length 40

set -g status-right "%d %b %R"
set -g status-utf8 on

# Identify activities on other windows
setw -g monitor-activity on
set -g visual-activity on

# Changing the default delay
set -sg escape-time 1

# Set windows and panes index
set -g base-index 1
setw -g pane-base-index 1

# Rename window
set-option -g allow-rename off

#switch panels
bind k selectp -U # switch to panel Up
bind j selectp -D # switch to panel Down 
bind h selectp -L # switch to panel Left
bind l selectp -R # switch to panel Right

" >> .tmux.conf
