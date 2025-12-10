#!/usr/bin/env bash
# Reducer: sums total duration per customer

awk -F'\t' '
{
  sums[$1] += $2
}
END {
  for (cust in sums) {
    print cust "\t" sums[cust]
  }
}
'
