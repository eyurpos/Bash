# Menu tips

- general
<pre>
select ITEM in [LIST]
do
  [COMMANDS]
done
</pre>

> PS3 - set question in menu

<pre>
PS3='Please enter ...'
select selected_var in option1 option2 option3 [..]; do
  echo "${RE{LY}}": "${selected_var}"
  break
done
</pre>

- case
<pre>
select option in "uptime" "user" "free diskspace" "quit"; do
    case option in
        uptime) uptime ;;
        user) echo "${USER}" ;;
        "free diskspace") df ;;
        quit) break ;;
        *) echo "Option not found" >&2
    esac
done
</pre>

## Other tools
> dialog tool

> zenity

