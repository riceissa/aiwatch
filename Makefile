read:
	mysql aiwatch -e "drop table if exists researchers"
	mysql aiwatch -e "drop table if exists positions"
	mysql aiwatch < sql/researchers.sql
	mysql aiwatch < sql/positions.sql
