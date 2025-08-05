#!/bin/bash

target_dir="images"
if [[ ! -d "${target_dir}" ]]; then
    mkdir "${target_dir}"
fi

file_index=1
fail_attempts=0

SECONDS=0
while (( file_index < 100 && SECONDS < 60 )); do
    url="https://downloads.codingcoursestv.eu/055%20-%20bash/while/images/image-${file_index}.jpg"
    output_file="${target_dir}/image-${file_index}.jpg"

    if ! curl -fs -o $output_file -O "${url}"; then
        (( fail_attempts++ ))
        if (( fail_attempts < 10 )); then
            continue
        fi
    fi
    fail_attempts=0
    (( file_index++ ))
done

ls "${target_dir}"
echo $SECONDS