#!/usr/bin/env bash
# Reducer: aggregates counts per hour

awk -F'\t' '
{
  counts[$1] += $2
}
END {
  for (h in counts) {
    print h "\t" counts[h]
  }
}
'
