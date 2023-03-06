#!/bin/bash

for file in $(git ls-files | grep -e '\.sql$')
do
    if [[ $(grep "^$file$" sql_files.txt) = "" ]]; then
	echo "We are missing the file $file"
    fi
done
