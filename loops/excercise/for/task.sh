#!/bin/bash

for path in $(realpath 'files/*'); do
    if [[ "${path##*.}" == 'txt' ]]; then

        if [[ "${path%.*}" == *".copy" ]]; then
            continue
        fi

        ln_name="${path%.*}.copy.${path##*.}"
        if [[ -f  "${ln_name}" ]]; then
            if find "${ln_name}" -type f -mtime -3 | grep -q .; then
                rm "${ln_name}"
            else
                continue
            fi
        fi

        ln "${path}" "${ln_name}" 
    fi
done