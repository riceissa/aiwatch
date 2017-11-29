create table organizations(
    organization_id int(11) not null auto_increment primary key,
    organization varchar(200) not null,
    former_name varchar(100),
    website varchar(100),
    team_page varchar(200),
    contact_email varchar(40),
    country varchar(40),  # Country of main activity
    key_people varchar(2000),
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

insert into organizations(organization, former_name, website, team_page, contact_email, country, key_people, launch_date, launch_date_precision, launch_date_url, urls, notes, facebook_username, instagram_username, medium_username, pinterest_username, timelines_wiki_page, tumblr_subdomain, twitter_username, wikipedia_page, youtube_username) values
    ('Machine Intelligence Research Institute','Singularity Institute for Artificial Intelligence','https://intelligence.org',NULL,NULL,'United States','Eliezer Yudkowsky,Nate Soares,Luke Muehlhauser','2000-01-01','year','https://intelligence.org/transparency/',NULL,NULL,'MachineIntelligenceResearchInstitute',NULL,NULL,NULL,'https://timelines.issarice.com/wiki/Timeline_of_Machine_Intelligence_Research_Institute',NULL,'MIRIBerkeley','https://en.wikipedia.org/wiki/Machine_Intelligence_Research_Institute','user/MIRIBerkeley')
    ,('Center for Human-Compatible AI',NULL,'http://humancompatible.ai/',NULL,NULL,'United States','Stuart Russsell,Bart Sellman,Michael Wellman,Andrew Critch','2016-08-01','month','http://www.openphilanthropy.org/focus/global-catastrophic-risks/potential-risks-advanced-artificial-intelligence/uc-berkeley-center-human-compatible-ai',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('Future of Life Institute',NULL,'https://futureoflife.org/',NULL,NULL,NULL,'Jaan Tallinn,Max Tegmark,Meia Chita-Tegmark,Viktoriya Krakovna,Anthony Aguirre','2014-03-01','month','https://en.wikipedia.org/wiki/Future_of_Life_Institute',NULL,NULL,'futureoflifeinstitute',NULL,NULL,NULL,NULL,NULL,'FLIxrisk','https://en.wikipedia.org/wiki/Future_of_Life_Institute','channel/UC-rCCy3FQ-GItDimSR9lhzw')
    ,('OpenAI',NULL,'https://openai.com/',NULL,NULL,'United States','Sam Altman,Elon Musk,Ilya Sutskever,Ian Goodfellow,Greg Brockman','2015-12-11','day','https://medium.com/backchannel/how-elon-musk-and-y-combinator-plan-to-stop-computers-from-taking-over-17e0e27dd02a',NULL,NULL,'openai.research',NULL,NULL,NULL,NULL,NULL,'openai','https://en.wikipedia.org/wiki/OpenAI',NULL)
    ,('Berkeley Existential Risk Initiative',NULL,'http://existence.org/',NULL,NULL,'United States','Andrew Critch,Gina Stuessy,Michael Keenan','2017-01-01','year',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('Future of Humanity Institute',NULL,'https://www.fhi.ox.ac.uk/',NULL,NULL,'United Kingdom','Nick Bostrom','2005-01-01','year','http://www.oxfordmartin.ox.ac.uk/research/programmes/future-humanity/',NULL,NULL,'FHIOxford',NULL,NULL,NULL,NULL,NULL,'FHIOxford','https://en.wikipedia.org/wiki/Future_of_Humanity_Institute','user/FHIOxford')
    ,('Montreal Institute for Learning Algorithms',NULL,'https://mila.quebec/en/','https://mila.quebec/en/mila/team/','lisa@iro.umontreal.ca','Canada','Yoshua Bengio',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('GoodAI',NULL,'https://www.goodai.com',NULL,'info@goodai.com','Czech Republic','Marek Rosa','2014-01-01','month','https://archive.is/e1HBN',NULL,NULL,'GoodArtificialIntelligence',NULL,NULL,NULL,NULL,NULL,'GoodAIdev',NULL,'channel/UCdBhluje9KahmlnU6cibZfg')
    ,('AIDEUS',NULL,'http://aideus.com/',NULL,'info@aideus.com','Russia','Alexey Potapov,Sergey Rodionov',NULL,NULL,NULL,'https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3070741',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('CogPrime',NULL,'https://wiki.opencog.org/w/CogPrime_Overview',NULL,NULL,'United States','Ben Goertzel',NULL,NULL,NULL,'https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3070741',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('Google DeepMind',NULL,'https://deepmind.com/',NULL,NULL,'United Kingdom','Demis Hassabis,Shane Legg,Mustafa Suleyman',NULL,NULL,NULL,'https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3070741',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
    ,('NARS',NULL,'https://sites.google.com/site/narswang/',NULL,NULL,'United States','Pei Wang',NULL,NULL,NULL,'https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3070741',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;

insert into organizations(organization)
select distinct(organization)
from positions
where organization not in (select organization from organizations);
