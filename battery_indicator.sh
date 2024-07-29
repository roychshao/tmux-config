#!/bin/bash

SWORD='🍖'
GHOST='🦴'

# Use upower to get the battery percentage
battery_percentage=$(upower -i $(upower -e | grep 'BAT') | grep 'percentage' | awk '{print $2}' | tr -d '%')

# Calculate the number of charged slots
charged_slots=$((battery_percentage / 10))

if [[ $charged_slots -gt 10 ]]; then
  charged_slots=10
fi

# Print the charged slots
for i in $(seq 1 $charged_slots); do echo -n "$SWORD"; done

# Print the uncharged slots
if [[ $charged_slots -lt 10 ]]; then
  for i in $(seq 1 $((10-charged_slots))); do echo -n "$GHOST"; done
fi
