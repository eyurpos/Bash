# General

https://google.github.io/styleguide/shellguide.html

## Pipe vs process substitution

### Normal pipe

Output of first command is used as standard input for second command.
> ls | wc - l
- ls executed in main shell
- wc executed in subshell

> echo "Test" | read -r topic
- Var {topic} not available from main shell

### Process substitution

Command is executed and result written to temporary file.
This temporary file used as input for redirection.

> wc -l < <(ls)

- wc executed in main shell
- ls executed in subshell

> read -r topic < <(echo "Test")
- Var {topic} available from main shell

## Split into different scripts

- Launch other script in subshell
> bash ./other-script.sh - if not executable

> ./other-script.sh - if executable

- Launch other script in same context

> source /other-script.sh

## Make bash script accessible throw PATH

> PATH="${PATH}:[new_path]"

- Script must:
    * be executable
    * have shebang
- Script should:
    * not have extension 

## Paths
- relative paths in script calculated basing on PWD from which script was being executed
- Options
    * use absolute path for each smd in script
    * change PWD at beginning (would not affect main shell)
    > cd /path
    * path to script
    > BASH_SOURCE[0]
    * get absolute path of script directory
    > <pre>parent_path=$( dirname -- "${BASH_SOURCE[0]}" )</pre>

## Shellcheck
> sudo apt  install shellcheck 

> shellcheck [script]