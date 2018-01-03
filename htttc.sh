#!/bin/env bash

if [ $# -lt 1 ]; then
        echo "Usage: $0 amount"
        exit 1
fi

AMOUNT=$1
TTC=$(echo "$AMOUNT*1.2" | bc -l)
HT=$(echo "$AMOUNT/1.2" | bc -l)

printf "TTC: %.2f €\\n" "$TTC"
printf "HT:  %.2f €\\n" "$HT"
