#!/usr/bin/env bash
# Mapper: emits hour of day and 1 for each call record
# Assumes CSV with a datetime field in the 2nd column: YYYY-MM-DD HH:MM:SS

awk -F',' '
NR>1 {
  # adjust column index if needed
  datetime = $2
  split(datetime, dt_parts, " ")
  if (length(dt_parts) > 1) {
    time_part = dt_parts[2]
    split(time_part, t_parts, ":")
    hour = t_parts[1]
    print hour "\t" 1
  }
}
'
