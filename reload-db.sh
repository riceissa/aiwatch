#!/bin/bash
# Define the MySQL command with explicit credentials
MYSQL="/c/Program Files/MySQL/MySQL Server 9.0/bin/mysql"
USER="root"
PASSWORD="new_password"
DATABASE="aiwatch"

# Replacement makefile as a workaround for use in Windows (Git Bash).

MYSQL="/c/Program Files/MySQL/MySQL Server 9.0/bin/mysql"

winpty "$MYSQL" -u root -pnew_password aiwatch -e "source sql/positions/80000hours-positions.sql"
winpty "$MYSQL" -u root -pnew_password aiwatch -e "drop table if exists people"
winpty "$MYSQL" -u root -pnew_password aiwatch -e "drop table if exists positions"
winpty "$MYSQL" -u root -pnew_password aiwatch -e "drop table if exists organizations"
winpty "$MYSQL" -u root -pnew_password aiwatch -e "drop table if exists products"
winpty "$MYSQL" -u root -pnew_password aiwatch -e "drop table if exists product_creators"
winpty "$MYSQL" -u root -pnew_password aiwatch -e "drop table if exists organization_documents"
winpty "$MYSQL" -u root -pnew_password aiwatch -e "drop table if exists documents"
winpty "$MYSQL" -u root -pnew_password aiwatch -e "drop table if exists agendas"

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

	winpty "$MYSQL" -u root -pnew_password aiwatch -e "source $file"
done

IFS=$OLDIFS
