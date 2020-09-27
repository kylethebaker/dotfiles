#!/bin/sh
# Shows the current battery level
msgName="show-battery"
msgId="888001"

date=$(date '+%-m/%d %-I:%M%P')
output=$(acpi -b | awk -F'[,: %]' '{print $4, $6}')
status=$(cut -d' ' -f1 <<< $output)
capacity=$(cut -d' ' -f2 <<< $output)
charging=$([ "$status" == "Discharging" ] && printf "-" || printf "+")

dunstify \
  -a "$msgName" \
  -u low \
  -r "$msgId" \
  "Battery${charging} ${capacity}%" \
  "${date}"
