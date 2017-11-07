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
    ,('Eliezer Yudkowsky','United States','yudkowsky',NULL,NULL,NULL,NULL,'http://yudkowsky.net/','http://yudkowsky.net/ https://intelligence.org/team/',NULL)
    ,('Paul Christiano','United States',NULL,'paulfchristiano',NULL,'paulfchristiano','Paul_Christiano','https://paulfchristiano.com','https://paulfchristiano.com/ai/',NULL)
    ,('Andreas Stuhlmüller',NULL,NULL,'stuhlmueller','stuhlmueller',NULL,NULL,'https://stuhlmueller.org/','https://arxiv.org/pdf/1707.05173.pdf',NULL)
    ,('Wei Dai',NULL,'wei.dai.587',NULL,NULL,NULL,NULL,'http://www.weidai.com/','http://lesswrong.com/user/Wei_Dai/overview/ https://en.bitcoin.it/wiki/Wei_Dai',NULL)
    ,('Toon Alfrink',NULL,'toon.alfrink',NULL,NULL,NULL,NULL,NULL,'https://wiki.lesswrong.com/wiki/Road_to_AI_Safety_Excellence http://lesswrong.com/user/toonalfrink/overview/ https://www.facebook.com/groups/1421511671230776/',NULL)
    ,('Iceman',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://tvtropes.org/pmwiki/pmwiki.php/FanFic/FriendshipIsOptimal https://www.fimfiction.net/user/16334/Iceman http://lesswrong.com/lw/fi8/launched_friendship_is_optimal/ http://lesswrong.com/r/discussion/lw/efi/friendship_is_optimal_a_my_little_pony_fanfic/ http://aisafety.com/wp-content/uploads/2017/09/AI_Safety_Community_Map_Version_1_4.jpg','From TV Tropes: "Author Tract: One of the author''s reasons for writing the story was to draw more attention to A.I. research and safety."')
    ,('Max Harms',NULL,NULL,NULL,NULL,NULL,NULL,'http://raelifin.com/','http://crystal.raelifin.com/ http://aisafety.com/wp-content/uploads/2017/09/AI_Safety_Community_Map_Version_1_4.jpg',NULL)
    ,('Jeff Kaufman',NULL,'jefftk','jeffkaufman',NULL,NULL,NULL,'https://www.jefftk.com','https://www.jefftk.com/p/superintelligence-risk-project-conclusion http://aisafety.com/wp-content/uploads/2017/09/AI_Safety_Community_Map_Version_1_4.jpg',NULL)
    ,('Gwern Branwen','United States','gwern.branwen','gwern',NULL,NULL,NULL,'https://www.gwern.net/','http://aisafety.com/wp-content/uploads/2017/09/AI_Safety_Community_Map_Version_1_4.jpg https://www.gwern.net/Complexity-vs-AI https://www.gwern.net/Tool-AI',NULL)
    ,('Federico Pistono',NULL,NULL,NULL,NULL,NULL,NULL,'http://federicopistono.org/','https://arxiv.org/pdf/1605.02817.pdf',NULL)
    ,('Vladimir Slepnev',NULL,'vladimir.slepnev',NULL,NULL,NULL,NULL,'http://slepnev.blogspot.com/','http://lesswrong.com/lw/mpn/link_vladimir_slepnev_talks_about_logical/ https://www.lesserwrong.com/posts/YDLGLnzJTKMEtti7Z/announcing-the-ai-alignment-prize',NULL)
    ,('Ryan Carey',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://agentfoundations.org/item?id=1699',NULL)
    ,('Chris Pasek',NULL,'chrispasek',NULL,NULL,NULL,NULL,NULL,'https://agentfoundations.org/item?id=1699',NULL)
    ,('Peter Scheyer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://agentfoundations.org/item?id=1699',NULL)
    ,('Scott Garrabrant',NULL,'coscott',NULL,NULL,NULL,'Scott_Garrabrant','http://scott.garrabrant.com/','http://scott.garrabrant.com/',NULL)
    ,('Jessica Taylor',NULL,'jessicaliutaylor','jessica-taylor',NULL,NULL,'Jessica_Taylor','http://jessic.at/',NULL,NULL)
    ,('Stuart Armstrong',NULL,'36817223',NULL,NULL,'Stuart_Armstrong','Stuart_Armstrong',NULL,NULL,NULL)
    ,('Benya Fallenstein',NULL,'benja.fallenstein',NULL,NULL,NULL,'Benja_Fallenstein',NULL,NULL,NULL)
    ,('Abram Demski',NULL,'abramdemski','abramdemski',NULL,NULL,'Abram_Demski',NULL,NULL,NULL)
;
