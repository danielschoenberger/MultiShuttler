#!/bin/bash

PZS=(1)
ARCHITECTURES=(
    "3 3 1 1"
    "3 3 2 2"
    "3 3 3 3"
    "4 4 1 1"
    "4 4 2 2"
    "4 4 3 3"
    "5 5 1 1"
    "5 5 2 2"
    "5 5 3 3"
    )

# Generate commands
commands=()
for num_of_pz in "${PZS[@]}"; do
    for arch in "${ARCHITECTURES[@]}"; do
        # Split the arch string into individual components
        set -- $arch
        commands+=("python3 run_parallel.py $num_of_pz $1 $2 $3 $4")
    done
done

parallel ::: "${commands[@]}"
