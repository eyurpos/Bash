#!/bin/bash

echo "In which months are work activities recorded for Saturdays?"
grep -rlF 'Saturday' work | cut -d'/' -f2
echo

echo "You want to find out in which months' log files the activity \
\"Deployment\" appears? Display only the corresponding filenames."
grep -rlF 'Development' work
echo

echo "How many meetings are recorded in the log files for each of the months?"
grep -rcF 'Meeting' work
echo

echo "Over the course of all given months, how many times was the activity \
\"Development\" performed from \"Home\" on Fridays?"
grep -rF 'Development' work | grep -F 'Home' | grep -cF 'Friday'
echo

echo "How many hours were worked on Fridays in January? \
Display only the \"Hours Worked,\" which is in the 5th field (column) of the file."
grep -rF "Friday" work | grep -F 'January' | cut -d',' -f5
