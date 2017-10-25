MYSQL_ARGS=

read:
	mysql $(MYSQL_ARGS) aiwatch -e "drop table if exists researchers"
	mysql $(MYSQL_ARGS) aiwatch -e "drop table if exists positions"
	mysql $(MYSQL_ARGS) aiwatch < sql/researchers.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions.sql
