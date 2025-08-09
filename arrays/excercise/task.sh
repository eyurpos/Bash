#!/bin/bash

declare -ri SIZE_THRESHOLD_MB=10

readarray -d '' dirs < <(find "$HOME" -mindepth 1 -maxdepth 1 -type d -print0)

for dir in "${dirs[@]}"; do
    size_mb=$(du -sm "$dir" | cut -f1)

    if (( size_mb > SIZE_THRESHOLD_MB )); then
        echo "$dir — ${size_mb} MB"
    fi
done