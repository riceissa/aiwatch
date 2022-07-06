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
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/80000-hours.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/abdul-latif-jameel-poverty-action-lab.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/ace.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/ai-challenge.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/ai-impacts.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/albert-schweitzer-foundation.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/alter.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/alvea.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/amf.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/animal-advocacy-africa.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/anthropic.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/arb-research.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/astera.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/beri.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/cea.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/center-for-emerging-risk-research.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/center-for-global-development.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/center-for-reducing-suffering.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/center-on-long-term-risk.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/centre-for-long-term-resilience.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/cfar.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/chai.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/charity-science-health.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/charity-science.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/cooperativeai.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/cset.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/ea-foundation.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/ea-retreats.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/effective-altruism-funds.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/effective-altruism-geneva.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/encultured-ai.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/epoch.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/farmed-animal-funders.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/forethought.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/ftx-future-fund.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/gcri.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/generation-pledge.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/gfi.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/give-directly.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/givewell.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/goodai.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/gwwc.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/happier-lives-institute.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/high-impact-athletes.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/ipa.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/johns-hopkins-center-for-health-security.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/legal-priorities-project.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/lesswrong.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/leverage-research.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/lifespan-extension-advocacy-foundation.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/longview-philanthropy.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/median-group.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/mercy-for-animals.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/metaculus.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/methuselah-foundation.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/miri.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/new-incentives.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/nonlinear-fund.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/nucleic-acid-observatory.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/one-for-the-world.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/open-philanthropy.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/openai.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/ought.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/paisri.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/pantask.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/probably-good.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/raising-for-effective-giving.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/redwood-research.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/rethink-charity.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/rethink-priorities.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/sci-foundation.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/sens.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/sentience-institute.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/sentience-politics.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/simon-institute.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/survival-and-flourishing.fund.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/survival-and-flourishing.org.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/the-humane-league.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/training-for-good.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/utility-farm.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/wasr.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/wild-animal-initiative.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/positions/wild-animal-suffering-research.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_documents.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/80000-hours-doc.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/ace-org-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/cea-org-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/cfar-org-docs.sql
	mysql $(MYSQL_ARGS) aiwatch < sql/organization_docs/effective-altruism-foundation-docs.sql
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
