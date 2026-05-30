#!/bin/bash

while IFS= read -r line #Internal field separator
do
    echo "$line"

done < 05-dates.sh
