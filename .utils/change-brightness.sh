#!/bin/sh
# Changes screen brightness
# Takes any xbacklight arg, like `-inc 10` or `-dec 10`
msgName="change-brightness"
msgId="888002"

xbacklight "$@"
brightness=$(printf "%.0f\n" $(xbacklight -getf))

dunstify \
  -a "$msgName" \
  -u low \
  -r "$msgId" \
  "Brightness ${brightness}%"
