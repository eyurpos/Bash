#!/bin/bash

echo "What is the Full Name for the User with User ID \"1001\"?"
grep -F '1001' passwd | cut -d':' -f5
echo

echo "What is the path to the home directory for the user backup?"
grep -F 'backup' passwd | cut -d':' -f6
echo

echo "How many users have Bash as their default shell?"
grep -cF '/bin/bash' passwd 
echo

echo "What is the line number for the information about Olivier?"
grep -nF 'Olivier' passwd | cut -d':' -f1
echo

echo "How many system accounts are there?"
grep -cF '/usr/sbin/nologin' passwd