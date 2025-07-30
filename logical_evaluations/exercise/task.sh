#!/bin/bash
file_link=https://downloads.codingcoursestv.eu/055%20-%20bash/if/romeo.txt

if [[ -f './romeo.txt' ]]; then
	echo 'File romeo.txt already exists, skipping download'
else
	echo 'Downloading file (romeo and juliet)...'
    if ! curl -s -O $file_link; then
        echo "Download failed!" >&2
        exit 1
    fi
fi

echo "Number of unique lines with 'love': \
$(grep -i 'love' romeo.txt | sort | uniq | wc -l)"

exit 0