#!/bin/bash

echo "How many requests have been answered with status 200 (successfully)?"
grep -cE '" 200\>' access.log
echo

echo "How many GET request have been issued to .zip files?"
grep -cE '\<GET (/[[:alnum:]]+)+\.zip' access.log
echo

echo "Can we extract IPv4 IPv6 addresses? \
Does the same IP ever send multiple request?"
grep -E '^[0-9a-z\.:]+' access.log | sort | uniq | wc -l
echo

echo "What is most requested URL from Firefox"
grep 'Firefox' access.log | grep -oP '(?<=GET )\S+' \
| sort |  uniq -c | sort -nr | head -n1 | cut -d' ' -f5