MYSQL_ARGS=

read:
	mysql $(MYSQL_ARGS) aiwatch -e "drop table if exists people"
	mysql $(MYSQL_ARGS) aiwatch -e "drop table if exists positions"
	mysql $(MYSQL_ARGS) aiwatch -e "drop table if exists organizations"
	mysql $(MYSQL_ARGS) aiwatch -e "drop table if exists products"
	mysql $(MYSQL_ARGS) aiwatch -e "drop table if exists product_creators"
	mysql $(MYSQL_ARGS) aiwatch < sql/positions-schema.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/people.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organizations.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/products.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/product_creators.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/givewell-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/cea-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/ace-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/open-phil-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/charity-science-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/charity-science-health-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/fri-positions.sql

access-portal/head_date.txt:
	git log -1 --format="%ad" --date=format:"%Y-%m-%d" > "$@"

.PHONY: fetch_tablesorter
fetch_tablesorter:
	curl -Lo access-portal/jquery.min.js \
		'https://code.jquery.com/jquery-3.2.1.min.js'
	curl -Lo access-portal/jquery.tablesorter.js \
		'https://raw.githubusercontent.com/Mottie/tablesorter/master/js/jquery.tablesorter.js'
	curl -Lo access-portal/tablesorter.css \
		'https://raw.githubusercontent.com/riceissa/tablesorter-bare-bones-theme/master/theme.css'

.PHONY: clean_tablesorter
clean_tablesorter:
	rm -f access-portal/jquery.min.js
	rm -f access-portal/jquery.tablesorter.js
	rm -f access-portal/tablesorter.css

.PHONY: fetch_anchorjs
fetch_anchorjs:
	curl -Lo access-portal/anchor.min.js \
		'https://raw.githubusercontent.com/bryanbraun/anchorjs/master/anchor.min.js'

.PHONY: clean_anchorjs
clean_anchorjs:
	rm -f access-portal/anchor.min.js
