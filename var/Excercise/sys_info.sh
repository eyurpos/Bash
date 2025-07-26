#!/usr/bin/env bash

declare -r text_blue="$(tput setaf 4)"
declare -r text_bold="$(tput bold)"
declare -r text_reset="$(tput sgr0)"

declare -r line="${text_blue}${text_bold}############################${text_reset}"

echo "${line}"
echo "Getting the uptime of the system: "
uptime | cut -c 2-
echo "${line}"
echo 'Top %CPU processes:'
ps -ef --sort=-pcpu | head -n 4
echo "${line}"
echo 'Disk usage for main drive: '
df | grep '/dev/sda2'
echo "${line}"
echo 'Available memory:'
grep 'MemAvailable:' /proc/meminfo
echo "${line}"
echo 'Display Manager satus'
systemctl status gdm.service | grep 'Active:' | cut -c 6-
echo "${line}"
echo 'Test the internet connection:'
ping -c 4 google.com
echo "${line}"