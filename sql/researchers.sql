create table researchers(
    researcher_id int(11) not null auto_increment primary key,
    researcher varchar(40) not null,
    country varchar(20),
    facebook_username varchar(100),
    github_username varchar(100),
    linkedin_username varchar(100),
    website varchar(40),
    urls varchar(2000),
    notes varchar(2000) default null,
    unique key researcher(`researcher`)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into researchers(researcher, country, facebook_username, github_username, linkedin_username, website, urls, notes) values
    ('Andrej Karpathy',NULL,NULL,'karpathy',NULL,'http://cs.stanford.edu/people/karpathy/','http://cs.stanford.edu/people/karpathy/ https://karpathy.github.io/',NULL)
    ,('Eliezer Yudkowsky','United States','yudkowsky',NULL,NULL,'http://yudkowsky.net/','http://yudkowsky.net/ https://intelligence.org/team/',NULL)
;
