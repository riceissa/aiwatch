MYSQL_ARGS=

read:
	mysql $(MYSQL_ARGS) aiwatch -e "drop table if exists people"
	mysql $(MYSQL_ARGS) aiwatch -e "drop table if exists positions"
	mysql $(MYSQL_ARGS) aiwatch -e "drop table if exists organizations"
	mysql $(MYSQL_ARGS) aiwatch -e "drop table if exists products"
	mysql $(MYSQL_ARGS) aiwatch -e "drop table if exists product_creators"
	mysql $(MYSQL_ARGS) aiwatch -e "drop table if exists organization_documents"
	mysql $(MYSQL_ARGS) aiwatch -e "drop table if exists documents"
	mysql $(MYSQL_ARGS) aiwatch -e "drop table if exists agendas"
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/positions-schema.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/products.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/product_creators.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/80000hours-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/ace-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/aiimpacts-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/amf-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/beri-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/cea-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/cfar-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/chai-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/charity-science-health-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/charity-science-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/cset-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/ea-foundation-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/forethought-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/fri-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/generation-pledge.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/gfi-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/give-directly.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/givewell-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/gwwc-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/high-impact-athletes.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/ipa-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/johns-hopkins-center-for-health-security.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/legal-priorities-project.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/lw2-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/median-group-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/mercy-for-animals.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/metaculus-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/new-incentives.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/one-for-the-world.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/openai-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/open-phil-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/ought-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/paisri-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/probably-good.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/rethink-charity.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/rethink-priorities.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/sentience-institute.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/sentience-politics-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/survival-and-flourishing.fund.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/survival-and-flourishing.org.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/the-humane-league-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/utility-farm.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/wasr-positions.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/wild-animal-initiative.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/wild-animal-suffering-research.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_documents.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/ace-org-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/cea-org-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/cfar-org-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/general-org-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/givewell-org-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/impossible-foods-org-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/lesswrong-org-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/leverage-research-org-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/miri-org-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/openai-org-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/open-phil-org-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/sentience-institute-org-docs.sql
	# Organizations file must be imported after all positions
	mysql $(MYSQL_ARGS) aiwatch < sql/organizations.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/agendas.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/documents.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/agenda_docs/iterated-amplification-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/agenda_docs/reward-modeling-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/people.sql
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
