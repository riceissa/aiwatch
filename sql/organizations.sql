create table organizations(
    organization_id int(11) not null auto_increment primary key,
    organization varchar(200) not null,
    other_names varchar(100),
    hosting_organization varchar(200),
    website varchar(100),
    team_page varchar(200),
    contact_email varchar(40),
    country varchar(40),  # Country of main activity
    launch_date date,
    launch_date_precision enum('day','month','year','multi-year'),
    launch_date_url varchar(200),
    urls varchar(2000),  # List of relevant URLs or source for information
    notes varchar(2000) default null,

    # Social media and standardized references
    facebook_username varchar(100),
    instagram_username varchar(100),
    medium_username varchar(100),
    pinterest_username varchar(100),
    timelines_wiki_page varchar(120),
    tumblr_subdomain varchar(100),
    twitter_username varchar(40),
    wikipedia_page varchar(120),
    youtube_username varchar(100),

    unique key organization(`organization`)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into organizations(organization, other_names, hosting_organization, website, team_page, contact_email, country, launch_date, launch_date_precision, launch_date_url, urls, notes, facebook_username, instagram_username, medium_username, pinterest_username, timelines_wiki_page, tumblr_subdomain, twitter_username, wikipedia_page, youtube_username) values
    ('Machine Intelligence Research Institute','MIRI|SIAI|Singularity Institute for Artificial Intelligence',NULL,'https://intelligence.org',NULL,NULL,'United States','2000-01-01','year','https://intelligence.org/transparency/',NULL,NULL,'MachineIntelligenceResearchInstitute',NULL,NULL,NULL,'https://timelines.issarice.com/wiki/Timeline_of_Machine_Intelligence_Research_Institute',NULL,'MIRIBerkeley','https://en.wikipedia.org/wiki/Machine_Intelligence_Research_Institute','user/MIRIBerkeley')
    ,('Center for Human-Compatible AI',NULL,NULL,'http://humancompatible.ai/',NULL,NULL,'United States','2016-08-01','month','http://www.openphilanthropy.org/focus/global-catastrophic-risks/potential-risks-advanced-artificial-intelligence/uc-berkeley-center-human-compatible-ai',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('Future of Life Institute',NULL,NULL,'https://futureoflife.org/',NULL,NULL,NULL,'2014-03-01','month','https://en.wikipedia.org/wiki/Future_of_Life_Institute',NULL,NULL,'futureoflifeinstitute',NULL,NULL,NULL,NULL,NULL,'FLIxrisk','https://en.wikipedia.org/wiki/Future_of_Life_Institute','channel/UC-rCCy3FQ-GItDimSR9lhzw')
    ,('OpenAI',NULL,NULL,'https://openai.com/',NULL,NULL,'United States','2015-12-11','day','https://medium.com/backchannel/how-elon-musk-and-y-combinator-plan-to-stop-computers-from-taking-over-17e0e27dd02a',NULL,NULL,'openai.research',NULL,NULL,NULL,NULL,NULL,'openai','https://en.wikipedia.org/wiki/OpenAI',NULL)
    ,('Berkeley Existential Risk Initiative',NULL,NULL,'http://existence.org/',NULL,NULL,'United States','2017-01-01','year',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('Future of Humanity Institute',NULL,NULL,'https://www.fhi.ox.ac.uk/',NULL,NULL,'United Kingdom','2005-01-01','year','http://www.oxfordmartin.ox.ac.uk/research/programmes/future-humanity/',NULL,NULL,'FHIOxford',NULL,NULL,NULL,NULL,NULL,'FHIOxford','https://en.wikipedia.org/wiki/Future_of_Humanity_Institute','user/FHIOxford')
    ,('Montreal Institute for Learning Algorithms',NULL,NULL,'https://mila.quebec/en/','https://mila.quebec/en/mila/team/','lisa@iro.umontreal.ca','Canada',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('GoodAI',NULL,NULL,'https://www.goodai.com',NULL,'info@goodai.com','Czech Republic','2014-01-01','month','https://archive.is/e1HBN',NULL,NULL,'GoodArtificialIntelligence',NULL,NULL,NULL,NULL,NULL,'GoodAIdev',NULL,'channel/UCdBhluje9KahmlnU6cibZfg')
    ,('AIDEUS',NULL,NULL,'http://aideus.com/',NULL,'info@aideus.com','Russia',NULL,NULL,NULL,'https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3070741',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('CogPrime',NULL,NULL,'https://wiki.opencog.org/w/CogPrime_Overview',NULL,NULL,'United States',NULL,NULL,NULL,'https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3070741',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('Google DeepMind',NULL,NULL,'https://deepmind.com/',NULL,NULL,'United Kingdom',NULL,NULL,NULL,'https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3070741',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('NARS',NULL,'Temple University','https://sites.google.com/site/narswang/',NULL,NULL,'United States',NULL,NULL,NULL,'https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3070741',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('AI Impacts',NULL,'Machine Intelligence Research Institute','https://aiimpacts.org/',NULL,NULL,'United States',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('Real AI',NULL,NULL,'http://realai.org/',NULL,'info@realai.org','Hong Kong',NULL,NULL,NULL,'https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3070741',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('Susaro',NULL,NULL,'http://www.susaro.com/',NULL,'enquiries@susaro.com','United Kingdom',NULL,NULL,NULL,'https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3070741',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('Whole Brain Architecture Initiative',NULL,NULL,'https://wba-initiative.org/en/',NULL,NULL,'Japan',NULL,NULL,NULL,'https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3070741',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('Learning Intelligent Distribution Agent',NULL,'University of Memphis','http://ccrg.cs.memphis.edu/',NULL,NULL,'United States',NULL,NULL,NULL,'https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3070741',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('FLOWERS',NULL,'INRIA, ENSTA ParisTech','https://flowers.inria.fr/',NULL,NULL,'France',NULL,NULL,NULL,'https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3070741',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('EthicsNet','OpenEth',NULL,'https://www.ethicsnet.com/','https://www.ethicsnet.com/about/',NULL,'United Kingdom','2016-06-01','month','https://gist.github.com/riceissa/468de4fe4a0834c1f31c20c945f21dd0','https://gist.github.com/riceissa/468de4fe4a0834c1f31c20c945f21dd0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('Theiss Research',NULL,NULL,'http://www.theissresearch.org/','https://web.archive.org/web/20160610165130/http://www.theissresearch.org:80/scientists',NULL,'United States','2006-01-01','month','https://web.archive.org/web/20160601043516/http://www.theissresearch.org:80/organization/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('Forethought Foundation for Global Priorities Research',NULL,'Centre for Effective Altruism','https://www.forethought.org/','https://www.forethought.org/about-us', 'contact@forethought.org','United Kingdom','2018-12-04','month','https://forum.effectivealtruism.org/posts/vxwcxwiDKCnyHJhbz/announcing-the-new-forethought-foundation-for-global',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('Open Philanthropy', 'Open Philanthropy Project|Open Phil', NULL, 'https://www.openphilanthropy.org/', 'https://www.openphilanthropy.org/about/team', NULL, 'United States', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Open_Philanthropy_(organization)', NULL)
    ,('Association for Long Term Existence and Resilience', 'ALTER', NULL, 'https://alter.org.il/', NULL, 'contact@alter.org.il', 'Israel', '2022-01-01', 'month', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
;

insert into organizations(organization)
select distinct(organization)
from positions
where organization not in (select organization from organizations);
