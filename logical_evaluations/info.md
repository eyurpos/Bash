# Logical evaluation

## Exit codes
- 0 - success, true
- 1.. == false
- [1-125] - failure, some shells use higher values for signals
Above 255 is truncated
- $? - exit code of last command

## Chaining commands
> [command1]; [command2] - command2 executes regardless of command1 status

> [command1] && [command2] - command2 executes if command1 success

> [command1] || [command2] - command2 executes if command1 failure

## If statement
<pre>
if command1; then
elif command2; then
else
fi
</pre>

## Test value
- [[ condition ]] - 0 if true, 1 if false
    * Word splitting and pathname expansions disabled
    * variable expansions and command substitutions work

### Comparison Operators
<pre>
(( == ))
-eq: Equal to
(( != ))
-ne: Not equal to
(( < ))
-lt: Less than
(( <= ))
-le: Less than or equal to
(( > ))
-gt: Greater than
(( >= ))
-ge: Greater than or equal to
</pre>

### String Comparison Operators
<pre>
= : Equal to
!= : Not equal to
< : Less than, in ASCII alphabetical order
> : Greater than, in ASCII alphabetical order
-z : is empty
-n : not empty 
</pre>

### Logical Operators
<pre>
&&: Logical AND
||: Logical OR
!: Logical NOT
</pre>

### File Test Operators
<pre>
-e: Checks if a file exists
-d: Checks if a directory exists
-f: Checks if a file is a regular file
-s: Checks if a file is not empty
-r: Checks if a file is readable file
-w: Checks if a file is writable file
-x: Checks if a file is executable file
</pre>

### Pattern matching
| Pattern | Description 
|-|-
| \ | Escapes a metacharacter, allowing it to be matched as a literal character
| . | Matches any single character except a newline character
| + | Matches one or more occurrences of the preceding character.
| ? | Makes the preceding character optional, matching zero or one occurrence
| * | Matches zero or more occurrences of the preceding character
| ^ | Matches the start of a string
| $ | Matches the end of a string
| \| | Indicates an OR condition between two expressions
| {} | Specifies a specific quantity of characters to match
| [...]	| Match any of the characters in a set
| -  | Specifies a range of characters when used within square brackets
| ?(patterns) |	Match zero or one occurrences of the patterns (extglob)
| *(patterns) | Match zero or more occurrences of the patterns (extglob)
| +(patterns) | Match one or more occurrences of the patterns (extglob)
| @(patterns) |	Match one occurrence of the patterns (extglob)
| !(patterns) |	Match anything that doesn't match one of the patterns (extglob)

https://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html

## Test programs
- /bin/[
> if [ condition ]; then

- /bin/test
> if test condition; then

* pattern matching not works
* filenames expansions works
* word splitting works

<pre>
> [[ 'file.txt' == *.txt]]; echo $?
> 0
> [ 'file.txt' == *.txt]; echo $?
> 0 - if only one 'file.txt' exists
> 1-255 - in all other case
</pre>

## Case statement
<pre>
case expression in
    pattern1)
        # code
        ;;
    pattern2) 
        # code
        ;& - continue with next
    pattern3|patter4) - alternative options
        # code
        ;;
    *) # default
        # code
        ;;
esac
</pre>
