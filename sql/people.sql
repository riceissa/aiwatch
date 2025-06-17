create table people(
    person_id int(11) not null auto_increment primary key,
    person varchar(40) not null,
    country varchar(20),
    facebook_username varchar(100),
    github_username varchar(100),
    linkedin_username varchar(100),
    lesswrong_username varchar(100),
    agentfoundations_username varchar(100),
    website varchar(40),
    urls varchar(2000),
    notes varchar(2000) default null,
    aiwatch_flag boolean,
    unique key person(`person`)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into people(person, country, facebook_username, github_username, linkedin_username, lesswrong_username, agentfoundations_username, website, urls, notes, aiwatch_flag) values
    ('Andrej Karpathy',NULL,NULL,'karpathy',NULL,NULL,NULL,'http://cs.stanford.edu/people/karpathy/','http://cs.stanford.edu/people/karpathy/ https://karpathy.github.io/',NULL,TRUE)
    ,('Eliezer Yudkowsky','United States','yudkowsky',NULL,NULL,NULL,'58','http://yudkowsky.net/','http://yudkowsky.net/ https://intelligence.org/team/',NULL,TRUE)
    ,('Paul Christiano','United States',NULL,'paulfchristiano',NULL,'paulfchristiano','Paul_Christiano','https://paulfchristiano.com','https://paulfchristiano.com/ai/',NULL,TRUE)
    ,('Andreas Stuhlmüller',NULL,NULL,'stuhlmueller','stuhlmueller',NULL,'180','https://stuhlmueller.org/','https://arxiv.org/pdf/1707.05173.pdf',NULL,TRUE)
    ,('Wei Dai',NULL,'wei.dai.587',NULL,NULL,'Wei_Dai','Wei_Dai','http://www.weidai.com/','http://lesswrong.com/user/Wei_Dai/overview/ https://en.bitcoin.it/wiki/Wei_Dai',NULL,TRUE)
    ,('Toon Alfrink',NULL,'toon.alfrink',NULL,NULL,NULL,NULL,NULL,'https://wiki.lesswrong.com/wiki/Road_to_AI_Safety_Excellence http://lesswrong.com/user/toonalfrink/overview/ https://www.facebook.com/groups/1421511671230776/',NULL,TRUE)
    ,('Iceman',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://tvtropes.org/pmwiki/pmwiki.php/FanFic/FriendshipIsOptimal https://www.fimfiction.net/user/16334/Iceman http://lesswrong.com/lw/fi8/launched_friendship_is_optimal/ http://lesswrong.com/r/discussion/lw/efi/friendship_is_optimal_a_my_little_pony_fanfic/ http://aisafety.com/wp-content/uploads/2017/09/AI_Safety_Community_Map_Version_1_4.jpg','From TV Tropes: "Author Tract: One of the author''s reasons for writing the story was to draw more attention to A.I. research and safety."',TRUE)
    ,('Max Harms',NULL,NULL,NULL,NULL,NULL,NULL,'http://raelifin.com/','http://crystal.raelifin.com/ http://aisafety.com/wp-content/uploads/2017/09/AI_Safety_Community_Map_Version_1_4.jpg',NULL,TRUE)
    ,('Jeff Kaufman',NULL,'jefftk','jeffkaufman',NULL,NULL,NULL,'https://www.jefftk.com','https://www.jefftk.com/p/superintelligence-risk-project-conclusion http://aisafety.com/wp-content/uploads/2017/09/AI_Safety_Community_Map_Version_1_4.jpg',NULL,TRUE)
    ,('Gwern Branwen','United States','gwern.branwen','gwern',NULL,NULL,NULL,'https://www.gwern.net/','http://aisafety.com/wp-content/uploads/2017/09/AI_Safety_Community_Map_Version_1_4.jpg https://www.gwern.net/Complexity-vs-AI https://www.gwern.net/Tool-AI',NULL,TRUE)
    ,('Federico Pistono',NULL,NULL,NULL,NULL,NULL,NULL,'http://federicopistono.org/','https://arxiv.org/pdf/1605.02817.pdf',NULL,TRUE)
    ,('Vladimir Slepnev',NULL,'vladimir.slepnev',NULL,NULL,'cousin_it','Vladimir_Slepnev','http://slepnev.blogspot.com/','http://lesswrong.com/lw/mpn/link_vladimir_slepnev_talks_about_logical/ https://www.lesserwrong.com/posts/YDLGLnzJTKMEtti7Z/announcing-the-ai-alignment-prize',NULL,TRUE)
    ,('Ryan Carey',NULL,NULL,NULL,NULL,NULL,'115','http://careyryan.com/','https://agentfoundations.org/item?id=1699',NULL,TRUE)
    ,('Chris Pasek',NULL,'chrispasek',NULL,NULL,NULL,NULL,NULL,'https://agentfoundations.org/item?id=1699 https://www.lesserwrong.com/posts/KgFrtaajjfSnBSZoH/ai-safety-research-camp-project-proposal',NULL,TRUE)
    ,('Peter Scheyer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://agentfoundations.org/item?id=1699',NULL,TRUE)
    ,('Scott Garrabrant',NULL,'coscott',NULL,NULL,NULL,'Scott_Garrabrant','http://scott.garrabrant.com/','http://scott.garrabrant.com/',NULL,TRUE)
    ,('Jessica Taylor',NULL,'jessicaliutaylor','jessica-taylor',NULL,NULL,'Jessica_Taylor','http://jessic.at/',NULL,NULL,TRUE)
    ,('Stuart Armstrong',NULL,'36817223',NULL,NULL,'Stuart_Armstrong','Stuart_Armstrong',NULL,NULL,NULL,TRUE)
    ,('Benya Fallenstein',NULL,'benja.fallenstein',NULL,NULL,NULL,'Benja_Fallenstein',NULL,NULL,NULL,TRUE)
    ,('Abram Demski',NULL,'abramdemski','abramdemski',NULL,NULL,'Abram_Demski',NULL,NULL,NULL,TRUE)
    ,('Vanessa Kosoy',NULL,'100008748870106',NULL,'vadim-kosoy-bb590a1','Squark','7',NULL,NULL,NULL,TRUE)
    ,('Patrick LaVictoire',NULL,'patrick.lavictoire',NULL,'patricklavictoire',NULL,'Patrick_LaVictoire','https://www.patricklavictoire.com/',NULL,NULL,TRUE)
    ,('Tsvi Benson-Tilsen',NULL,'tsvi.bt',NULL,NULL,NULL,'Tsvi_Benson-Tilsen',NULL,NULL,NULL,TRUE)
    ,('Alex Mennen',NULL,'alexmennen',NULL,NULL,NULL,'29','http://alexmennen.com/','https://www.lesserwrong.com/posts/4WbNGQMvuFtY3So7s/announcement-ai-alignment-prize-winners-and-next-round',NULL,TRUE)
    ,('Sam Eisenstat',NULL,NULL,NULL,NULL,NULL,'57',NULL,NULL,NULL,TRUE)
    ,('Nate Soares',NULL,'so8res','Soares','so8res','So8res','Nate_Soares','http://so8r.es/','http://so8r.es/resume.pdf',NULL,TRUE)
    ,('Janos Kramar',NULL,'janos.kramar',NULL,NULL,NULL,'42',NULL,NULL,NULL,TRUE)
    ,('Kaj Sotala',NULL,'Xuenay',NULL,NULL,NULL,'23','http://kajsotala.fi/',NULL,NULL,TRUE)
    ,('Jim Babcock',NULL,'jimrandomh',NULL,NULL,NULL,'11',NULL,NULL,NULL,TRUE)
    ,('Daniel Dewey',NULL,'100012286783343',NULL,NULL,NULL,'Daniel_Dewey','http://www.danieldewey.net/',NULL,NULL,TRUE)
    ,('Kaya Stechly',NULL,'kaya.fallenstein','from3004','kaya-stechly-5ba68713',NULL,'4','http://from3004.github.io/',NULL,NULL,TRUE)
    ,('Mihaly Barasz',NULL,'mihaly.barasz','klao',NULL,NULL,NULL,'http://nilcons.com/',NULL,NULL,TRUE)
    ,('David Krueger',NULL,'13963931',NULL,NULL,NULL,'111',NULL,NULL,NULL,TRUE)
    ,('Sune Kristian Jakobsen',NULL,'sune.k.jakobsen',NULL,NULL,NULL,'83',NULL,NULL,NULL,TRUE)
    ,('Ramana Kumar',NULL,NULL,NULL,NULL,NULL,'Ramana_Kumar',NULL,NULL,NULL,TRUE)
    ,('Jack Gallagher',NULL,'herokocho','GallagherCommaJack',NULL,NULL,'79','http://gallabytes.com/',NULL,NULL,TRUE)
    ,('Alex Appel',NULL,'alex.appel.75',NULL,NULL,NULL,'50',NULL,NULL,NULL,TRUE)
    ,('Owen Cotton-Barratt',NULL,'owen.cottonbarratt',NULL,NULL,'owencb','208',NULL,NULL,NULL,TRUE)
    ,('Tom Everitt',NULL,'tom.everitt',NULL,NULL,NULL,'108','http://www.tomeveritt.se/','http://www.tomeveritt.se/cv.pdf',NULL,TRUE)
    ,('Vladimir Nesov',NULL,'vladimir.nesov',NULL,NULL,'Vladimir_Nesov','Vladimir_Nesov',NULL,NULL,NULL,TRUE)
    ,('Marcello Herreshoff',NULL,'marcello.herreshoff',NULL,NULL,NULL,'223',NULL,NULL,NULL,TRUE)
    ,('Victoria Krakovna',NULL,'vkrakovna',NULL,NULL,NULL,'70','https://vkrakovna.wordpress.com/',NULL,NULL,TRUE)
    ,('Nisan Stiennon',NULL,'nisan.stiennon',NULL,NULL,NULL,'Nisan_Stiennon',NULL,NULL,NULL,TRUE)
    ,('Gary Drescher',NULL,'gary.drescher',NULL,NULL,'Gary_Drescher','Gary_Drescher',NULL,NULL,NULL,TRUE)
    ,('Jan Leike',NULL,'100009882604264',NULL,NULL,NULL,'160',NULL,NULL,NULL,TRUE)
    ,('Sören Mindermann',NULL,NULL,NULL,NULL,NULL,'267',NULL,NULL,NULL,TRUE)
    ,('Amanda Askell',NULL,'amanda.askell',NULL,NULL,NULL,NULL,'http://www.amandaaskell.com','https://docs.google.com/spreadsheets/d/1iBy--zMyIiTgybYRUQZIm11WKGQZcixaCmIaysRmGvk',NULL,TRUE)
    ,('Hilary Greaves',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://docs.google.com/spreadsheets/d/1iBy--zMyIiTgybYRUQZIm11WKGQZcixaCmIaysRmGvk',NULL,TRUE)
    ,('Jade Leung',NULL,'jade.leung.14',NULL,NULL,NULL,NULL,NULL,'https://docs.google.com/spreadsheets/d/1iBy--zMyIiTgybYRUQZIm11WKGQZcixaCmIaysRmGvk',NULL,TRUE)
    ,('Zac Kenton',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://docs.google.com/spreadsheets/d/1iBy--zMyIiTgybYRUQZIm11WKGQZcixaCmIaysRmGvk',NULL,TRUE)
    ,('Girish Sastry',NULL,'gyratortron','gsastry','girish-sastry-2a39348',NULL,NULL,'http://girishsastry.com/','https://docs.google.com/spreadsheets/d/1iBy--zMyIiTgybYRUQZIm11WKGQZcixaCmIaysRmGvk',NULL,TRUE)
    ,('Vladimir Shakirov',NULL,'sergej.shegurin',NULL,NULL,NULL,NULL,NULL,'https://arxiv.org/abs/1605.04232','Also known as Sergej Shegurin.',TRUE)
    ,('David J. Jilk',NULL,'djilk',NULL,NULL,NULL,NULL,'http://www.jilk.com','http://www.tandfonline.com/eprint/DzAkuxSZTMM9JYVkjUMS/full http://effective-altruism.com/ea/14w/2017_ai_risk_literature_review_and_charity/ https://arxiv.org/abs/1604.06963', NULL,TRUE)
    ,('Seth J. Herd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.tandfonline.com/eprint/DzAkuxSZTMM9JYVkjUMS/full',NULL,TRUE)
    ,('Stephen J. Read',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.tandfonline.com/eprint/DzAkuxSZTMM9JYVkjUMS/full',NULL,TRUE)
    ,('Randall C. O’Reilly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.tandfonline.com/eprint/DzAkuxSZTMM9JYVkjUMS/full',NULL,TRUE)
    ,('Sophie-Charlotte Fischer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.allandafoe.com/aireadings',NULL,TRUE)
    ,('Alexey Turchin','Russia','turchin.alexei',NULL,NULL,'turchin',NULL,'https://avturchin.livejournal.com/','https://ieet.org/index.php/IEET2/bio/turchin https://ieet.org/index.php/IEET2/more/turchin20150722 http://immortality-roadmap.com/aisafety.pdf http://lesswrong.com/lw/mgf/a_map_agi_failures_modes_and_levels/',NULL,TRUE)
    ,('Dustin Juliano',NULL,NULL,NULL,NULL,NULL,NULL,'http://dustinjuliano.com/','http://aisecurity.org/ http://dustinjuliano.com/papers/',NULL,TRUE)
    ,('Matteo Turchetta',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://wrai.org/slides/Safe%20Reinforcement%20Learning%20in%20Robotics%20with%20Bayesian%20Models%20-%20Felix%20Berkenkamp.pdf',NULL,TRUE)
    ,('Angela P. Schoellig',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://wrai.org/slides/Safe%20Reinforcement%20Learning%20in%20Robotics%20with%20Bayesian%20Models%20-%20Felix%20Berkenkamp.pdf',NULL,TRUE)
    ,('Andreas Krause',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://wrai.org/slides/Safe%20Reinforcement%20Learning%20in%20Robotics%20with%20Bayesian%20Models%20-%20Felix%20Berkenkamp.pdf',NULL,TRUE)
    ,('Tobias Baumann',NULL,NULL,NULL,NULL,NULL,NULL,'http://tobiasbaumann.me/','http://s-risks.org/focus-areas-of-worst-case-ai-safety/ http://s-risks.org/training-neural-networks-to-detect-suffering/',NULL,TRUE)
    ,('Jim O’Neill',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://foresight.org/publications/AGI-Timeframes&PolicyWhitePaper.pdf',NULL,TRUE)
    ,('Will Sawin','United States','will.sawin',NULL,NULL,NULL,NULL,'http://williamsawin.com/','http://williamsawin.com/cv.pdf',NULL,TRUE)
    ,('Alex Flint',NULL,'alex.j.flint',NULL,'alexjflint',NULL,NULL,'http://www.alexflint.io/','https://haseebq.com/why-you-should-give-now-not-later/','Manages a donor-advised fund and is “very well-versed in AI risk”.',TRUE)
    ,('Alex Zhu',NULL,'alexjzhu',NULL,NULL,NULL,NULL,NULL,'https://web.archive.org/web/20180106183846/https://espr-camp.org/staff/','“Currently splits his time between AlphaSheets and thinking about AI risk.”',TRUE)
    ,('Gordon Irlam',NULL,NULL,NULL,NULL,NULL,NULL,'http://www.gordoni.com/','https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3070741',NULL,TRUE)
    ,('Tom McGrath',NULL,'thomas.m.mcgrath','tomMcGrath',NULL,NULL,NULL,'https://tommcgrath.github.io/',NULL,NULL,TRUE)
    ,('Remmelt Ellen',NULL,'remmelt.ellen',NULL,NULL,NULL,NULL,NULL,'https://www.lesserwrong.com/posts/KgFrtaajjfSnBSZoH/ai-safety-research-camp-project-proposal',NULL,TRUE)
    ,('Linda Linsefors','Sweden','linda.linsefors','LindaLinsefors',NULL,NULL,NULL,NULL,'https://docs.google.com/document/d/1NkYDp3zns-cyasAk_WDrhj6DlJ9QjMP24fM7jTvWPqM/edit https://www.lesserwrong.com/posts/KgFrtaajjfSnBSZoH/ai-safety-research-camp-project-proposal',NULL,TRUE)
    ,('Nandi Schoots','Netherlands','nandi.schoots',NULL,'nandi-schoots-70bba8125',NULL,NULL,NULL,'https://www.lesserwrong.com/posts/KgFrtaajjfSnBSZoH/ai-safety-research-camp-project-proposal',NULL,TRUE)
    ,('David Kristoffersson','Sweden','100012144258163',NULL,'davidkristoffersson',NULL,NULL,NULL,'https://www.lesserwrong.com/posts/KgFrtaajjfSnBSZoH/ai-safety-research-camp-project-proposal',NULL,TRUE)
    ,('John Maxwell',NULL,'johnmaxwelliv',NULL,NULL,NULL,NULL,NULL,'https://www.lesserwrong.com/posts/4WbNGQMvuFtY3So7s/announcement-ai-alignment-prize-winners-and-next-round',NULL,TRUE)
    ,('Anne Wissemann',NULL,'anne.wissemann',NULL,NULL,NULL,NULL,NULL,'http://archive.today/2018.06.14-212014/https://aisafetycamp.com/about-us/','Executive assistant to Allan Dafoe, but unclear what the exact arrangement is.',TRUE)
    ,('David Manheim', 'Israel', NULL, 'davidmanheim', NULL, 'davidmanheim', NULL, NULL, NULL, NULL,TRUE)
    ,('Ram Rachum', 'Israel', NULL, 'cool-RR', 'ram-rachum-349b7a17', 'ram-rachum', NULL, 'https://r.rachum.com', NULL, 'Research in Multi-Agent Reinforcement Learning',TRUE);


# Insert the rest of the people by taking names from positions
insert into people(person)
select distinct(person)
from positions
where person not in (select person from people);

insert into people(person)
select distinct(name)
from product_creators
where name not in (select person from people);

# The substring_index stuff is a workaround because some documents with
# multiple authors are stored as pipe-delimited strings, in which case we want
# to insert each name separately. Since MySQL has no easy way to do that, we
# are just inserting the first author in such cases. This should only affect a
# small percentage of cases.
insert into people(person)
select distinct(substring_index(author,"|",1))
from organization_documents
where substring_index(author,"|",1) not in (select person from people);

insert into people(person)
select distinct(substring_index(author,"|",1))
from documents
where substring_index(author,"|",1) not in (select person from people);
