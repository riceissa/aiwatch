MYSQL_ARGS=-u root -pnew_password aiwatch

read:
	./make-reload-db.sh "$(MYSQL_ARGS)"

access-portal/head_date.txt:
	git log -1 --format="%ad" --date=format:"%Y-%m-%d" > "$@"

.PHONY: fetch_tablesorter
fetch_tablesorter:
	curl --ssl-no-revoke -Lo access-portal/jquery.min.js \
		'https://code.jquery.com/jquery-3.7.1.min.js'
	curl --ssl-no-revoke -Lo access-portal/jquery.tablesorter.js \
		'https://raw.githubusercontent.com/Mottie/tablesorter/master/js/jquery.tablesorter.js'
	curl --ssl-no-revoke -Lo access-portal/tablesorter.css \
		'https://raw.githubusercontent.com/riceissa/tablesorter-bare-bones-theme/master/theme.css'

.PHONY: clean_tablesorter
clean_tablesorter:
	rm -f access-portal/jquery.min.js
	rm -f access-portal/jquery.tablesorter.js
	rm -f access-portal/tablesorter.css

.PHONY: fetch_anchorjs
fetch_anchorjs:
	curl --ssl-no-revoke -Lo access-portal/anchor.min.js \
		'https://raw.githubusercontent.com/bryanbraun/anchorjs/master/anchor.min.js'

.PHONY: clean_anchorjs
clean_anchorjs:
	rm -f access-portal/anchor.min.js
