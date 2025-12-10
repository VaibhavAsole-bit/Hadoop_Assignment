#!/bin/bash

# Expected CSV columns:
# caller_id,receiver_id,call_duration,call_type,...

while IFS=',' read -r caller_id receiver_id call_duration call_type rest; do
  # Skip header (first row)
  if [ "$caller_id" = "caller_id" ]; then
    continue
  fi

  # If call_type is not empty, emit call_type \t 1
  if [ -n "$call_type" ]; then
    printf "%s\t1\n" "$call_type"
  fi
done
