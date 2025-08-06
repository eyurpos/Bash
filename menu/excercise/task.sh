#!/bin/bash

PS3="Please select an option: "
select option in "Add new student" "Show students" "Quit"; do
    case $option in
        "Add new student")
            echo "Adding a new student..."
            input_var=
            name=
            surname=
            declare -i age=0
            while true; do
                read -r -p "Enter student\`s name: " input_var
                if [[ "$input_var" =~ ^[a-zA-Z]+$ ]]; then
                    name="${input_var}"
                    break
                else
                    echo "Input contains characters other than letters." >&2
                fi
            done
            while true; do
                read -r -p "Enter student\`s surname: " input_var
                if [[ "$input_var" =~ ^[a-zA-Z]+$ ]]; then
                    surname="${input_var}"
                    break
                else
                    echo "Input contains characters other than letters." >&2
                fi
            done
            while true; do
                read -r -p "Enter student\`s age: " input_var
                if [[ "$input_var" =~ ^[0-9]+$ ]]; then
                    age="${input_var}"
                    break
                else
                    echo "Input is not a valid integer." >&2
                fi
            done

            read -p "Do you want to save record? (y/n): " answer
            case "$answer" in
                [Yy]* ) echo "${name} ${surname} ${age}" >> students.txt;;
                * ) echo "Record would not be selected";;
            esac
            ;;
        "Show students")
            if [[ -f students.txt && ! -s "filename.txt" ]]; then
                echo "Showing all students:"
                cat students.txt
            else
                echo "No record found!" >&2
            fi
            ;;
        "Quit")
            break
            ;;
        *)
            echo "Invalid option. Please try again." >&2
            ;;
    esac
done