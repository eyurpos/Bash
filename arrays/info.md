# Arrays

## General

- declare

> array_name=(item1 item2 ... )

> declare -a array_name=(item1 item2 ... )

- access

> "${array_name[i]}" - from head

> "${array_name[-i]}" - from tail

> "${array_name[@]}" - whole array

> "${array_name[*]}" - whole array, would be splitted by IFS

- change value

> "${array_name[i]}"=value - from head

> "${array_name[-i]}"=value - from tail

- add new element

> "${array_name[new_index]}"=new_value

> array_name+=(new_value)

<pre>
- convert normal variable to array. Normal value can be treated as array of 1 element

var="value"
var[1]="new_value"
</pre>

- delete element

> unset array_name[index] - indexing keep same, element at index empty

- length

> "${#array_name[@]}"

> "${#array_name[*]}" 

- slicing

> ${array_name[@]:index:length}

- copying

> copy_array=("${original_array[@]}")

## Loops
<pre>
for el in "${array[@]}"; do
    #code
done
</pre>

<pre>
select el in "${array[@]}"; do
    #code
done
</pre>

## Read array

- stdin
> read -p "" -a array

> read -a array < <(command)

- multiline, file
> readarray -t array < file.txt
<pre>
-t - skip /n
-s - skip line
-n - number of lines
</pre>

## Search element
<pre>
search_element() {
    local element="$1"
    shift
    local array=("$@")

    for i in "${!array[@]}"; do
        if [[ "${array[$i]}" == "$element" ]]; then
            echo "Found '$element' at index $i"
            return 0
        fi
    done

    echo "'$element' not found"
    return 1
}
</pre>

## Associative arrays

> declare -A array_name

<pre>
declare -A array_name=(
    ["key"]=value
)
</pre>

> array_name[key]=value

> "${array_name[key]}"

> "${array_name[@]}" - values

> "${!array_name[@]}" - keys

<pre>
for key in "${!array_name[@]}"; do
    "${array_name[$key]}"
done
</pre>

- [[ -v array_name[key] ]] - check existence of the key 