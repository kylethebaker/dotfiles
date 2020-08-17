#!/bin/bash
# Launch current tmux session, or create a new one if none exists
alacritty -e bash -c "tmux -q has-session && exec tmux attach-session || exec tmux new-session"
