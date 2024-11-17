#!/bin/bash

# Replacement makefile as a workaround for use in Windows (Git Bash).

MYSQL="/c/Program Files/MySQL/MySQL Server 8.0/bin/mysql"

winpty "$MYSQL" --defaults-extra-file="$HOME/.my.cnf" aiwatch -e "drop table if exists people"
winpty "$MYSQL" --defaults-extra-file="$HOME/.my.cnf" aiwatch -e "drop table if exists positions"
winpty "$MYSQL" --defaults-extra-file="$HOME/.my.cnf" aiwatch -e "drop table if exists organizations"
winpty "$MYSQL" --defaults-extra-file="$HOME/.my.cnf" aiwatch -e "drop table if exists products"
winpty "$MYSQL" --defaults-extra-file="$HOME/.my.cnf" aiwatch -e "drop table if exists product_creators"
winpty "$MYSQL" --defaults-extra-file="$HOME/.my.cnf" aiwatch -e "drop table if exists organization_documents"
winpty "$MYSQL" --defaults-extra-file="$HOME/.my.cnf" aiwatch -e "drop table if exists documents"
winpty "$MYSQL" --defaults-extra-file="$HOME/.my.cnf" aiwatch -e "drop table if exists agendas"

OLDIFS=$IFS
IFS=$'\r\n'

echo "Going to load from sql_files.txt"

FILES=( $( cat sql_files.txt ) )

echo "Finished loading from sql_files.txt"

for file in ${FILES[@]}; do
	# uncomment the line below to see information printed for each file examined
	# echo "Examining file '$file'"
	# Skip blank lines
	[ -z "$file" ] && continue

	# Skip lines that begin with "#" as they are comments
	[[ $file == \#* ]] && continue

	winpty "$MYSQL" --defaults-extra-file="$HOME/.my.cnf" aiwatch -e "source $file"
done

IFS=$OLDIFS
