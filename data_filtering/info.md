# Data filtering

## GREP

- searching stdin

[command with stdout] | grep -F [pattern]

- searching in a file

grep -F [pattern] [file ...]

<pre>
-F - disable regex
'PATTERN' - disable expansions
-i - case insensitive search
-n - print line number
-o - print only find part
-c - count
-r - recursive search
-s - suppress error messages
-l - show only names that contains pattern
-q - check if pattern is present (0 - yes, 1 - no)
</pre>

## Patterns
- BRE - basic regular expressions
<pre>
metachars

. - any single char (except '\n')
^ - beginning of a line
$ - end of a line
\ - disable metachar
* - any char 0-n times
</pre>

<pre>
char classes

[..] - match any vowel
[..-..] - ranges
[0-9] - digits
[a-zA-Z] - all letters
[^] - not, applicable to all range
[]* - 0-n times
</pre>

| POSIX Character Class | Description | Matches example characters 
|-|-|-
| [:alnum:] | Alphanumeric characters | A-Z, a-z, 0-9 
| [:alpha:]	| Alphabetic characters	| A-Z, a-z
| [:lower:]	| Lowercase letters | a-z
| [:upper:]	| Uppercase letters	| A-Z
| [:digit:]	| Digits | 0-9
| [:xdigit:] | Hexadecimal digits | 0-9, A-F, a-f
| [:blank:]	| Space and tab	| space, tab | 
| [:cntrl:]	| Control characters | ASCII control codes
| [:print:]	| Printable characters	| All visible + space
| [:punct:]	| Punctuation characters | ! " # $ % & ' ( ) * + , - . / etc.
| [:space:]	| Whitespace characters	| space, tab, newline, vertical tab, etc.
| [:graph:]	| Visible characters | All printable except space

<pre>
char groups
\(...\)
</pre>

- ERE - extended regular expressions -E
<pre>
alternations
pattern1|pattern2|pattern3
</pre>

| Qualifier | Meaning | Example  | Matches |
| - | - | - | - |
| `*` | Zero or more times | `a*` | `""`, `a`, `aa`, `aaa` 
| `+` | One or more times | `a+`     | `a`, `aa`, `aaa`, but **not** `""` 
| `?` | Zero or one time (optional) | `a?` | `""` or `a` 
| `{n}` | Exactly n times | `a{3}` | `aaa` 
| `{n,}` | At least n times | `a{2,}` | `aa`, `aaa`, `aaaa` 
| `{n,m}` | Between n and m times (inclusive) | `a{2,4}` | `aa`, `aaa`, or `aaaa` 

<pre>
word boundaries

\< matches the start of a word
\> matches the end of a word
\b matches a word boundary
</pre>

<pre>
[[ "${variable}" =~ pattern ]] - ERE match, 0 - yes 1 - no
</pre>

