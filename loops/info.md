# Loops

## While
<pre>
while command | [[ condition ]]; do
    # code
    if [[ condition ]]; then
        continue - skip further code, next iteration
    fi
    # code
    if [[ condition ]]; then
        break - stop loop iteration
    fi
    # code
done
</pre>

- read file, line by line
<pre>
while IFS= read -r my_line; do
    echo "${my_line}"
done < file.txt
</pre>

## For 
<pre>
for [variable] in [elements]; do
    # code
    if [[ condition ]]; then
        continue - skip further code, next iteration
    fi
    # code
    if [[ condition ]]; then
        break - stop loop iteration
    fi
done
</pre>

<pre>
- sequence 
for [variable] in {start..end}; do
    # code
done
</pre>

<pre>
- reverse sequence 
for [variable] in {end..start}; do
    # code
done
</pre>

<pre>
- sequence command substitution
start=1
end=5
for [variable] in $(seq start end)$; do
    # code
done
</pre>

<pre>
- file name expansion 
for file in *.txt; do
    # code
done
</pre>

<pre>
for (( init; test; after)); do
    # code
done

for (( i=0; i<10; i++)); do
    # code
done
</pre>