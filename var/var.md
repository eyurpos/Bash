- shebang
<pre>#!/bin/bash</pre>

- comments
<pre># - single comment</pre>
<pre>: - NOP, not recomend, but can be used as multiline comment</pre>
<pre>
: << 'multiline_comment'
This is content here...
1234
-----------------------
multiline_comment
</pre>

- Variables
<pre>my_variable=value</pre>
<pre>Variables case sensative
myVar and myvar - different vars
</pre>
<pre>No data types.
name='Name'
number=123
content="$(ls .)"
</pre>
- Access
<pre>
echo "Hello ${var1}, $var2"
</pre>
<pre>
Enviromental variables best practise - UPPER_CASE.
Bash script - lover_case.
</pre>
- Declare
<pre>
declare [options] var=value
- -r - read only
- -i - interger
- -x - enviroment variable
- -p - print all variables
- can be used to define variable without assigning value
- can be used all together (-xri)
</pre>
- Unset
<pre>
- assign empty value
> var=
- complete remve
> unset var
</pre>
- read user input
<pre>
> read -p "Enter text: " input_var
> echo "${input_var}"
> read -p "Enter text: " input_var1 input_var2
> man read
Ex:
> read hours rest < <(uptime)
> IFS=";" read -p "Enter text: (delimeter";")" input_var1 input_var2
</pre>
- read content
<pre>
> file_content="$(cat file.txt)"
> file_content="$(< file.txt)"
</pre>
