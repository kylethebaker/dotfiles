#!/bin/bash
# Changes volume with notification
# Accepts any amixer volume adjustment, like `3%+` or `toggle`
msgName="change-volume"
msgId="888000"

amixer -D pulse -q sset Master "$@" > /dev/null

newState="$(amixer -c 0 get Master | tail -1)"
volume="$(awk '{print $4}' <<< $newState | sed 's/[^0-9]*//g')"
mute="$(awk '{print $6}' <<< $newState | sed 's/[^a-z]*//g')"

if [[ $volume == 0 || "$mute" == "off" ]]; then
    dunstify \
      -a "$msgName" \
      -u low \
      -i audio-volume-muted \
      -r "$msgId" \
      "Volume muted"
else
    dunstify \
      -a "$msgName" \
      -u low \
      -i audio-volume-high \
      -r "$msgId" \
      "Volume ${volume}%"
fi

canberra-gtk-play -i audio-volume-change -d "$msgName"
