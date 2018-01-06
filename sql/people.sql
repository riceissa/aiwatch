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
    unique key person(`person`)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into people(person, country, facebook_username, github_username, linkedin_username, lesswrong_username, agentfoundations_username, website, urls, notes) values
    ('Andrej Karpathy',NULL,NULL,'karpathy',NULL,NULL,NULL,'http://cs.stanford.edu/people/karpathy/','http://cs.stanford.edu/people/karpathy/ https://karpathy.github.io/',NULL)
    ,('Eliezer Yudkowsky','United States','yudkowsky',NULL,NULL,NULL,'58','http://yudkowsky.net/','http://yudkowsky.net/ https://intelligence.org/team/',NULL)
    ,('Paul Christiano','United States',NULL,'paulfchristiano',NULL,'paulfchristiano','Paul_Christiano','https://paulfchristiano.com','https://paulfchristiano.com/ai/',NULL)
    ,('Andreas Stuhlmüller',NULL,NULL,'stuhlmueller','stuhlmueller',NULL,'180','https://stuhlmueller.org/','https://arxiv.org/pdf/1707.05173.pdf',NULL)
    ,('Wei Dai',NULL,'wei.dai.587',NULL,NULL,'Wei_Dai','Wei_Dai','http://www.weidai.com/','http://lesswrong.com/user/Wei_Dai/overview/ https://en.bitcoin.it/wiki/Wei_Dai',NULL)
    ,('Toon Alfrink',NULL,'toon.alfrink',NULL,NULL,NULL,NULL,NULL,'https://wiki.lesswrong.com/wiki/Road_to_AI_Safety_Excellence http://lesswrong.com/user/toonalfrink/overview/ https://www.facebook.com/groups/1421511671230776/',NULL)
    ,('Iceman',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://tvtropes.org/pmwiki/pmwiki.php/FanFic/FriendshipIsOptimal https://www.fimfiction.net/user/16334/Iceman http://lesswrong.com/lw/fi8/launched_friendship_is_optimal/ http://lesswrong.com/r/discussion/lw/efi/friendship_is_optimal_a_my_little_pony_fanfic/ http://aisafety.com/wp-content/uploads/2017/09/AI_Safety_Community_Map_Version_1_4.jpg','From TV Tropes: "Author Tract: One of the author''s reasons for writing the story was to draw more attention to A.I. research and safety."')
    ,('Max Harms',NULL,NULL,NULL,NULL,NULL,NULL,'http://raelifin.com/','http://crystal.raelifin.com/ http://aisafety.com/wp-content/uploads/2017/09/AI_Safety_Community_Map_Version_1_4.jpg',NULL)
    ,('Jeff Kaufman',NULL,'jefftk','jeffkaufman',NULL,NULL,NULL,'https://www.jefftk.com','https://www.jefftk.com/p/superintelligence-risk-project-conclusion http://aisafety.com/wp-content/uploads/2017/09/AI_Safety_Community_Map_Version_1_4.jpg',NULL)
    ,('Gwern Branwen','United States','gwern.branwen','gwern',NULL,NULL,NULL,'https://www.gwern.net/','http://aisafety.com/wp-content/uploads/2017/09/AI_Safety_Community_Map_Version_1_4.jpg https://www.gwern.net/Complexity-vs-AI https://www.gwern.net/Tool-AI',NULL)
    ,('Federico Pistono',NULL,NULL,NULL,NULL,NULL,NULL,'http://federicopistono.org/','https://arxiv.org/pdf/1605.02817.pdf',NULL)
    ,('Vladimir Slepnev',NULL,'vladimir.slepnev',NULL,NULL,'cousin_it','Vladimir_Slepnev','http://slepnev.blogspot.com/','http://lesswrong.com/lw/mpn/link_vladimir_slepnev_talks_about_logical/ https://www.lesserwrong.com/posts/YDLGLnzJTKMEtti7Z/announcing-the-ai-alignment-prize',NULL)
    ,('Ryan Carey',NULL,NULL,NULL,NULL,NULL,'115','http://careyryan.com/','https://agentfoundations.org/item?id=1699',NULL)
    ,('Chris Pasek',NULL,'chrispasek',NULL,NULL,NULL,NULL,NULL,'https://agentfoundations.org/item?id=1699',NULL)
    ,('Peter Scheyer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://agentfoundations.org/item?id=1699',NULL)
    ,('Scott Garrabrant',NULL,'coscott',NULL,NULL,NULL,'Scott_Garrabrant','http://scott.garrabrant.com/','http://scott.garrabrant.com/',NULL)
    ,('Jessica Taylor',NULL,'jessicaliutaylor','jessica-taylor',NULL,NULL,'Jessica_Taylor','http://jessic.at/',NULL,NULL)
    ,('Stuart Armstrong',NULL,'36817223',NULL,NULL,'Stuart_Armstrong','Stuart_Armstrong',NULL,NULL,NULL)
    ,('Benya Fallenstein',NULL,'benja.fallenstein',NULL,NULL,NULL,'Benja_Fallenstein',NULL,NULL,NULL)
    ,('Abram Demski',NULL,'abramdemski','abramdemski',NULL,NULL,'Abram_Demski',NULL,NULL,NULL)
    ,('Vadim Kosoy',NULL,'100008748870106',NULL,'vadim-kosoy-bb590a1','Squark','7',NULL,NULL,NULL)
    ,('Patrick LaVictoire',NULL,'patrick.lavictoire',NULL,'patricklavictoire',NULL,'Patrick_LaVictoire','https://www.patricklavictoire.com/',NULL,NULL)
    ,('Tsvi Benson-Tilsen',NULL,'tsvi.bt',NULL,NULL,NULL,'Tsvi_Benson-Tilsen',NULL,NULL,NULL)
    ,('Alex Mennen',NULL,'alexmennen',NULL,NULL,NULL,'29','http://alexmennen.com/',NULL,NULL)
    ,('Sam Eisenstat',NULL,NULL,NULL,NULL,NULL,'57',NULL,NULL,NULL)
    ,('Nate Soares',NULL,'so8res','Soares','so8res','So8res','Nate_Soares','http://so8r.es/','http://so8r.es/resume.pdf',NULL)
    ,('Janos Kramar',NULL,'janos.kramar',NULL,NULL,NULL,'42',NULL,NULL,NULL)
    ,('Kaj Sotala',NULL,'Xuenay',NULL,NULL,NULL,'23','http://kajsotala.fi/',NULL,NULL)
    ,('Jim Babcock',NULL,'jimrandomh',NULL,NULL,NULL,'11',NULL,NULL,NULL)
    ,('Daniel Dewey',NULL,'100012286783343',NULL,NULL,NULL,'Daniel_Dewey','http://www.danieldewey.net/',NULL,NULL)
    ,('Kaya Stechly',NULL,'kaya.fallenstein','from3004','kaya-stechly-5ba68713',NULL,'4','http://from3004.github.io/',NULL,NULL)
    ,('Mihaly Barasz',NULL,'mihaly.barasz','klao',NULL,NULL,NULL,'http://nilcons.com/',NULL,NULL)
    ,('David Krueger',NULL,'13963931',NULL,NULL,NULL,'111',NULL,NULL,NULL)
    ,('Sune Kristian Jakobsen',NULL,'sune.k.jakobsen',NULL,NULL,NULL,'83',NULL,NULL,NULL)
    ,('Ramana Kumar',NULL,NULL,NULL,NULL,NULL,'Ramana_Kumar',NULL,NULL,NULL)
    ,('Jack Gallagher',NULL,'herokocho','GallagherCommaJack',NULL,NULL,'79','http://gallabytes.com/',NULL,NULL)
    ,('Alex Appel',NULL,'alex.appel.75',NULL,NULL,NULL,'50',NULL,NULL,NULL)
    ,('Owen Cotton-Barratt',NULL,'owen.cottonbarratt',NULL,NULL,'owencb','208',NULL,NULL,NULL)
    ,('Tom Everitt',NULL,'tom.everitt',NULL,NULL,NULL,'108','http://www.tomeveritt.se/','http://www.tomeveritt.se/cv.pdf',NULL)
    ,('Vladimir Nesov',NULL,'vladimir.nesov',NULL,NULL,'Vladimir_Nesov','Vladimir_Nesov',NULL,NULL,NULL)
    ,('Marcello Herreshoff',NULL,'marcello.herreshoff',NULL,NULL,NULL,'223',NULL,NULL,NULL)
    ,('Viktoriya Krakovna',NULL,'vkrakovna',NULL,NULL,NULL,'70','https://vkrakovna.wordpress.com/',NULL,NULL)
    ,('Nisan Stiennon',NULL,'nisan.stiennon',NULL,NULL,NULL,'Nisan_Stiennon',NULL,NULL,NULL)
    ,('Gary Drescher',NULL,'gary.drescher',NULL,NULL,'Gary_Drescher','Gary_Drescher',NULL,NULL,NULL)
    ,('Jan Leike',NULL,'100009882604264',NULL,NULL,NULL,'160',NULL,NULL,NULL)
    ,('Sören Mindermann',NULL,NULL,NULL,NULL,NULL,'267',NULL,NULL,NULL)
    ,('Amanda Askell',NULL,'amanda.askell',NULL,NULL,NULL,NULL,'http://www.amandaaskell.com','https://docs.google.com/spreadsheets/d/1iBy--zMyIiTgybYRUQZIm11WKGQZcixaCmIaysRmGvk',NULL)
    ,('Hilary Greaves',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://docs.google.com/spreadsheets/d/1iBy--zMyIiTgybYRUQZIm11WKGQZcixaCmIaysRmGvk',NULL)
    ,('Jade Leung',NULL,'jade.leung.14',NULL,NULL,NULL,NULL,NULL,'https://docs.google.com/spreadsheets/d/1iBy--zMyIiTgybYRUQZIm11WKGQZcixaCmIaysRmGvk',NULL)
    ,('Zac Kenton',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://docs.google.com/spreadsheets/d/1iBy--zMyIiTgybYRUQZIm11WKGQZcixaCmIaysRmGvk',NULL)
    ,('Girish Sastry',NULL,'gyratortron','gsastry','girish-sastry-2a39348',NULL,NULL,'http://girishsastry.com/','https://docs.google.com/spreadsheets/d/1iBy--zMyIiTgybYRUQZIm11WKGQZcixaCmIaysRmGvk',NULL)
    ,('Vladimir Shakirov',NULL,'sergej.shegurin',NULL,NULL,NULL,NULL,NULL,'https://arxiv.org/abs/1605.04232','Also known as Sergej Shegurin.')
    ,('David J. Jilk',NULL,'djilk',NULL,NULL,NULL,NULL,'http://www.jilk.com','http://www.tandfonline.com/eprint/DzAkuxSZTMM9JYVkjUMS/full http://effective-altruism.com/ea/14w/2017_ai_risk_literature_review_and_charity/ https://arxiv.org/abs/1604.06963', NULL)
    ,('Seth J. Herd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.tandfonline.com/eprint/DzAkuxSZTMM9JYVkjUMS/full',NULL)
    ,('Stephen J. Read',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.tandfonline.com/eprint/DzAkuxSZTMM9JYVkjUMS/full',NULL)
    ,('Randall C. O’Reilly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.tandfonline.com/eprint/DzAkuxSZTMM9JYVkjUMS/full',NULL)
    ,('Sophie-Charlotte Fischer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.allandafoe.com/aireadings',NULL)
    ,('Alexey Turchin','Russia','turchin.alexei',NULL,NULL,'turchin',NULL,'https://avturchin.livejournal.com/','https://ieet.org/index.php/IEET2/bio/turchin https://ieet.org/index.php/IEET2/more/turchin20150722 http://immortality-roadmap.com/aisafety.pdf http://lesswrong.com/lw/mgf/a_map_agi_failures_modes_and_levels/',NULL)
    ,('Dustin Juliano',NULL,NULL,NULL,NULL,NULL,NULL,'http://dustinjuliano.com/','http://aisecurity.org/ http://dustinjuliano.com/papers/',NULL)
    ,('Matteo Turchetta',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://wrai.org/slides/Safe%20Reinforcement%20Learning%20in%20Robotics%20with%20Bayesian%20Models%20-%20Felix%20Berkenkamp.pdf',NULL)
    ,('Angela P. Schoellig',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://wrai.org/slides/Safe%20Reinforcement%20Learning%20in%20Robotics%20with%20Bayesian%20Models%20-%20Felix%20Berkenkamp.pdf',NULL)
    ,('Andreas Krause',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://wrai.org/slides/Safe%20Reinforcement%20Learning%20in%20Robotics%20with%20Bayesian%20Models%20-%20Felix%20Berkenkamp.pdf',NULL)
    ,('Tobias Baumann',NULL,NULL,NULL,NULL,NULL,NULL,'http://tobiasbaumann.me/','http://s-risks.org/focus-areas-of-worst-case-ai-safety/ http://s-risks.org/training-neural-networks-to-detect-suffering/',NULL)
    ,('Jim O’Neill',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://foresight.org/publications/AGI-Timeframes&PolicyWhitePaper.pdf',NULL)
    ,('Will Sawin','United States','will.sawin',NULL,NULL,NULL,NULL,'http://williamsawin.com/','http://williamsawin.com/cv.pdf',NULL)
    ,('Alex Flint',NULL,'alex.j.flint',NULL,'alexjflint',NULL,NULL,'http://www.alexflint.io/','https://haseebq.com/why-you-should-give-now-not-later/','Manages a donor-advised fund and is “very well-versed in AI risk”.')
    ,('Alex Zhu',NULL,'alexjzhu',NULL,NULL,NULL,NULL,NULL,'https://web.archive.org/web/20180106183846/https://espr-camp.org/staff/','“Currently splits his time between AlphaSheets and thinking about AI risk.”')
;

# Insert the rest of the people by taking names from positions
insert into people(person)
select distinct(person)
from positions
where person not in (select person from people);
