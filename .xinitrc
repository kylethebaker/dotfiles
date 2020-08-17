#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Apply keyboard remappings
xmodmap /home/kyle/.Xmodmap

# Load latest Xresources
xrdb /home/kyle/.Xresources

# Start window composting
picom &

# Enable ssh-agent
eval $(ssh-agent)

# Setup media hotkeys
xbindkeys

# Start wm
exec spectrwm
