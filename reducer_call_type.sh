#!/bin/bash

current_key=""
current_sum=0

# Read "key<TAB>value" from mapper
while IFS=$'\t' read -r key value; do
  # Skip empty keys
  [ -z "$key" ] && continue

  # Ensure value is numeric
  if ! [[ "$value" =~ ^[0-9]+$ ]]; then
    continue
  fi

  if [ "$key" = "$current_key" ]; then
    current_sum=$(( current_sum + value ))
  else
    if [ -n "$current_key" ]; then
      printf "%s\t%d\n" "$current_key" "$current_sum"
    fi
    current_key="$key"
    current_sum=$value
  fi
done

# Print last key
if [ -n "$current_key" ]; then
  printf "%s\t%d\n" "$current_key" "$current_sum"
fi
