#!/bin/bash

echo "Get all lines that start with \"Favorite\""
grep '^Favorite' self.conf
echo 

echo "Get all lines where there is no value set \
for the option, i.e. Some Preference:"
grep ':$' self.conf
echo

echo "Get all lines where there is some some monetary value (indicated by \"$\")"
grep '\$' self.conf
echo

echo "Get all lines where \"Travel\" is part of the option name (left of \":\")"
grep -i 'Travel.*:' self.conf
echo

echo "Get all lines where where there have been 3 preferences set (separated by ,) \
like Interests: Coding, Gardening, Space Exploration"
grep ':.*,.*,.*' self.conf
echo

echo "Get all personal URL associated to Rachel \
(where her first name is part of the domain), for example https://rachel.dev"
name=$(grep -i 'name' self.conf | awk '{print $2}')
grep -i "//.*${name}" self.conf
echo
