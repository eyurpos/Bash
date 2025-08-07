# Arguments

> \$0 - executable

> \$1..\$9 - optional arguments

> \${10}..\${n} - optional arguments

> \$# - number of positional arguments

> \$@ - provides arguments as array

> \$* - provides arguments as single string

> \$\$ - PID

> shift [number] - shifts positional parameters to the left

<pre>
while (( $# != 0)); do
    echo " - $1"
done
</pre>

# getopts

## no param

> getopts [available-args] [var]

<pre>
while getopts [available-args] [var] 2> dev/null; do
    echo "${var}" 
done
</pre>

<pre>
while getopts :[available-args] [var]; do
    echo "${var}" 
done
</pre>

<pre>
what=""
while getopts 'alh' opt 2> dev/null; do
    case opt in
        h)
        what="help"
        break
        ;;
        a)
        #code
        ;;
        l)
        #code
        ;;
        ?)
        echo "Error" >&2
        ;;
    esac
done

if [[ "${what}" == "help" ]]
    echo "This is help menu
    exit
fi
</pre>

## with param

<pre>
- f - require parameter
- OPTARG - access to parameter
while getopts ":af:' opt; do
    echo "${opt}" - "${OPTARG}"
done
</pre>