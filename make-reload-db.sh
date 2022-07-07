#!/bin/bash

# Print each command before running, as Make would
set -o xtrace

# Argument $1 will be MYSQL_ARGS passed from makefile

mysql $1 aiwatch -e "drop table if exists people"
mysql $1 aiwatch -e "drop table if exists positions"
mysql $1 aiwatch -e "drop table if exists organizations"
mysql $1 aiwatch -e "drop table if exists products"
mysql $1 aiwatch -e "drop table if exists product_creators"
mysql $1 aiwatch -e "drop table if exists organization_documents"
mysql $1 aiwatch -e "drop table if exists documents"
mysql $1 aiwatch -e "drop table if exists agendas"


while read file; do
	# Skip blank lines
	[ -z "$file" ] && continue

	# Skip lines that begin with "#" as they are comments
	[[ $file == \#* ]] && continue

	mysql $1 aiwatch < "$file"
done < sql_files.txt
