# Functions

## Declaration 
<pre>
- function declaration
function_name() {
    # Code
}

function_name
</pre>

<pre>
- alternative function declaration
function function_name {
    # Code
}

function_name
</pre>

## Vars
- variable declared in function is global by default
<pre>
function_name( ) {
    my_var='1' 
    # code
}

echo "${my_var}"
</pre>

- declare as local to make var local
<pre>
function_name( ) {
    local my_var='1' 
    # code
}
</pre>

## Passing data to function
### stdin into function
<pre>
function_name( ) {
    read value - will ask cli input
}
</pre>

<pre>
function_name( ) {
    read value
}

echo "data" | function_name
</pre>

### positional arguments
<pre>
function_name( ) {
    echo $1
}

function_name "data"
</pre>

### default values
<pre>
function_name( ) {
    local var=${1:-"default data"}
    echo "${var}"
}

function_name "data"
</pre>

## return value
- 'return' returns exit code of function
<pre>
function_name( ) {
    if [[ condition ]]; then
        return 1
    fi
    return 0
}

echo $?
</pre>

- to return other values - can be used global variable
<pre>
function_name1( ) {
    my_var='1' 
    return 0
}

function_name2( ) {
    echo "${my_var}"
    return 0
}
</pre>

- stdout - can be used to return
<pre>
function_name1( ) {
    echo "data"
    return 0
}

function_name2( ) {
    local my_var=$(function_name1)
    return 0
}
</pre>