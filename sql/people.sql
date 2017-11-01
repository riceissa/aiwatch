create table people(
    person_id int(11) not null auto_increment primary key,
    person varchar(40) not null,
    country varchar(20),
    facebook_username varchar(100),
    github_username varchar(100),
    linkedin_username varchar(100),
    website varchar(40),
    urls varchar(2000),
    notes varchar(2000) default null,
    unique key person(`person`)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into people(person, country, facebook_username, github_username, linkedin_username, website, urls, notes) values
    ('Andrej Karpathy',NULL,NULL,'karpathy',NULL,'http://cs.stanford.edu/people/karpathy/','http://cs.stanford.edu/people/karpathy/ https://karpathy.github.io/',NULL)
    ,('Eliezer Yudkowsky','United States','yudkowsky',NULL,NULL,'http://yudkowsky.net/','http://yudkowsky.net/ https://intelligence.org/team/',NULL)
    ,('Paul Christiano','United States',NULL,'paulfchristiano',NULL,'https://paulfchristiano.com','https://paulfchristiano.com/ai/',NULL)
    ,('Andreas Stuhlmüller',NULL,NULL,'stuhlmueller','stuhlmueller','https://stuhlmueller.org/','https://arxiv.org/pdf/1707.05173.pdf',NULL)
    ,('Wei Dai',NULL,'wei.dai.587',NULL,NULL,'http://www.weidai.com/','http://lesswrong.com/user/Wei_Dai/overview/ https://en.bitcoin.it/wiki/Wei_Dai',NULL)
    ,('Toon Alfrink',NULL,'toon.alfrink',NULL,NULL,NULL,'https://wiki.lesswrong.com/wiki/Road_to_AI_Safety_Excellence http://lesswrong.com/user/toonalfrink/overview/ https://www.facebook.com/groups/1421511671230776/',NULL)
    ,('Iceman',NULL,NULL,NULL,NULL,NULL,'http://tvtropes.org/pmwiki/pmwiki.php/FanFic/FriendshipIsOptimal https://www.fimfiction.net/user/16334/Iceman http://lesswrong.com/lw/fi8/launched_friendship_is_optimal/ http://lesswrong.com/r/discussion/lw/efi/friendship_is_optimal_a_my_little_pony_fanfic/ http://aisafety.com/wp-content/uploads/2017/09/AI_Safety_Community_Map_Version_1_4.jpg','From TV Tropes: "Author Tract: One of the author''s reasons for writing the story was to draw more attention to A.I. research and safety."')
    ,('Max Harms',NULL,NULL,NULL,NULL,'http://raelifin.com/','http://crystal.raelifin.com/ http://aisafety.com/wp-content/uploads/2017/09/AI_Safety_Community_Map_Version_1_4.jpg',NULL)
;
