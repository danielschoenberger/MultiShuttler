#!/bin/bash

PZS=(1 2 5)
ARCHITECTURES=(
    "3 3 1 1"
    "3 3 2 2"
    "3 3 3 3"
    "4 4 1 1"
    "4 4 2 2"
    "4 4 3 3"
    )

# Generate commands
commands=()
for num_of_pz in "${PZS[@]}"; do
    for arch in "${ARCHITECTURES[@]}"; do
        # Split the arch string into individual components
        set -- $arch
        commands+=("python3 run_parallel_qft.py $num_of_pz $1 $2 $3 $4")
    done
done

parallel ::: "${commands[@]}"
