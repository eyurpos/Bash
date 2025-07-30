# Math

## Arithmetic Operators
<pre>
+: Addition
-: Subtraction
*: Multiplication
/: Division
%: Modulus (remainder of division)
For exponentiation, use external tools like bc or awk
</pre>

## Integers
- Double round brackets (())
<pre>
> x=1; y=2;
> ((result = x + y + 1))
> echo ${result}
</pre>

<pre>
> echo "+: $((1 + 2))
> echo "-: $((1 - 2))
> echo "*: $((1 * 2))
> echo "/: $((1 / 2))
</pre>

- Declare integer var
<pre>
> declare -i ivar
> ivar=1
> ivar='2'
> ivar='3+4' - being evaluated
> ivar=5*x - being evaluated
> ivar=5 * x - error
> ivar=$((5 * x )) - being evaluated
</pre>

<pre>
> declare ivar
> ivar='3+4' - not being evaluated
> ivar=5+x - not being evaluated
</pre>

- Read integer

<pre>
Not predicted behavior
> declare -r ivar
> x=2
> read ivar
> : 'x*x' - being evaluated, results in 4 
</pre>
    
<pre>
Ignore char
> read var
> declare -i ivar="$(value//[^0-9]/)"
</pre>

<pre>
Error if not only digits
> declare -i ivar
> if [[ -z ${var//[0-9]} ]]; then      # or ${var//[[:digit:]]}
>    return 1
> else
>    ivar=var
> fi
</pre>

## Decimals
- Modulo operator
<pre>
> echo "$((15/13))"
> 1
> echo "$((15%13))"
> 2
</pre>
- bc
<pre>
> echo "12.3 + 4.5" | bc
> echo "scale=4; 12.3 / 4.5" | bc
</pre>

## AWK
- analyze text files (tabular data, separated by ";")
> awk '{sum+=$1} END {print sum} [source]

> awk -F ';' {sum+=$1} END {print sum} [source]

> awk '{print $1}' [source]