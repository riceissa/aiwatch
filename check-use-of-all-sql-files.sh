#!/bin/bash

for file in $(git ls-files *.sql)
do
    if [[ $(grep "^$file$" sql_files.txt) = "" ]]; then
	echo "We are missing the file $file"
    fi
done
