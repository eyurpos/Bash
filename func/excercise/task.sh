#!/bin/bash

declare -r FILE_NAME='trivia.json'

get_num_of_questions() {
    jq '.results | length' "${FILE_NAME}"
}

get_random_question_number() {
    local base="${1:-10}"
    local arr_name="$2"
    local -n arr_ref="$arr_name"
    local -i num found

    while true; do
        num=$(( RANDOM % base ))

        found=0
        for n in "${arr_ref[@]}"; do
            if [[ "$n" -eq "$num" ]]; then
                found=1
                break
            fi
        done

        if [[ $found -eq 0 ]]; then
            arr_ref+=("$num")
            echo "$num"
            return 0
        fi
    done
}

declare question=""
declare -i correct_pos=
declare -a answers

read_question() {
    local index="${1:-0}"
    local -a incorrect_answers
    local correct_answer

    question=$(jq -r ".results[$index].question" "$FILE_NAME" | perl -MHTML::Entities -pe 'decode_entities($_);')
    correct_answer=$(jq -r ".results[$index].correct_answer" "$FILE_NAME" | sed 's/&quot;/"/g')
    readarray -t incorrect_answers < <(jq -r ".results[$index].incorrect_answers[]" "$FILE_NAME" | sed 's/&quot;/"/g')

    local total_answers=$(( ${#incorrect_answers[@]} + 1 ))
    correct_pos=$(( RANDOM % total_answers ))
    answers=()

    local idx_incorrect=0
    for (( i=0; i<total_answers; i++ )); do
        if (( i == correct_pos )); then
            answers[i]="$correct_answer"
        else
            answers[i]="${incorrect_answers[idx_incorrect]}"
            ((idx_incorrect++))
        fi
    done
}

ask_question() {
    echo "$question"
    local num_answers=${#answers[@]}
    PS3="Select your answer (1-${num_answers}): "
    select opt in "${answers[@]}"; do
        if [[ -z "$opt" ]]; then
            echo "Invalid selection. Try again."
            continue
        fi

        if (( REPLY - 1 == correct_pos )); then
            echo "Correct!"
            return 0
        else
            echo "Incorrect!"
            return 1
        fi
    done
}

quiz_game() {
    local -ri MAX_QUESTIONS=10

    local -i correct_answers=0
    local -i total_num_of_questions
    total_num_of_questions=$(get_num_of_questions)

    local -a question_numbers=()   # store numbers of questions

    while (( ${#question_numbers[@]} < MAX_QUESTIONS )); do
        echo $i
        local question_number
        # Pass the array name 'question_numbers' as second argument
        question_number=$(get_random_question_number \
                         "${total_num_of_questions}" \
                         question_numbers)
        question_numbers+=("$num")

        read_question "$question_number" 
        clear
        echo "Question number ${#question_numbers[@]}"
        if ask_question; then
            correct_answers=$(( correct_answers + 1 ))
        fi
        sleep 0.5
    done

    echo "Total number of correct answers: ${correct_answers}"
}

show_start_menu() {
    local answer
    while true; do
        read -p "Do you want to play? (y/n): " answer
        case "$answer" in
            [Yy]* ) return 0 ;;  # Yes
            [Nn]* ) return 1 ;;  # No
            * ) echo "Please select yes or no" ;;
        esac
    done
}

main() {
    if show_start_menu; then
        echo "Lets play!!!"
        sleep 0.3
        quiz_game
    else
        echo "Goodbye"
    fi
}

main