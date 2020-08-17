#!/bin/sh
output=$(acpi -b | awk -F'[,: %]' '{print $4, $6}')
status=$(cut -d' ' -f1 <<< $output)
capacity=$(cut -d' ' -f2 <<< $output)

if [ "$status" = Discharging -a "$capacity" -lt 5 ]; then
  notify-send \
    -u critical \
    "Battery Low (${capacity}%)" \
    ""
fi

if [ "$status" = Discharging -a "$capacity" -lt 2 ]; then
  notify-send \
    -u critical \
    "Shutting down, battery too low" \
    ""
  logger "Critical battery threshold, hiberating"
  systemctl hibernate
fi
