#!/usr/bin/env bash
# Mapper: emits customer_id and call_duration
# Assumes:
#   - customer_id is in column 1
#   - call_duration (in seconds) is in column 3

awk -F',' '
NR>1 {
  customer_id = $1
  duration = $3 + 0
  if (customer_id != "" && duration > 0) {
    print customer_id "\t" duration
  }
}
'
