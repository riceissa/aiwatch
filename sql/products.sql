create table products(
    product_id int(11) not null auto_increment primary key,
    product_name varchar(40) not null,
    creator varchar(40),
    creator_type enum('person','organization'),
    creation_date date,
    creation_date_precision enum('day','month','year','multi-year'),
    url varchar(200),
    description varchar(2000)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into products(tool_name, creator, creator_type, creation_date, creation_date_precision, url, description) values
    ('AI Watch','Issa Rice','person','2017-10-23','day','https://aiwatch.issarice.com/','A website to track people and organizations working on AI safety.')
    ,('The Uncertain Future','Machine Intelligence Research Institute','organization',NULL,NULL,'http://theuncertainfuture.com/','A tool to model future technology and its effect on civilization.')
    ,('AGI Failures Modes and Levels map','Alexey Turchin','person','2015-01-01','year','http://immortality-roadmap.com/AIfails.pdf','A flowchart about failure modes of artificial general intelligence, grouped by the stage of development. There is an accompanying post on LessWrong at <http://lesswrong.com/lw/mgf/a_map_agi_failures_modes_and_levels/>.')
    ,('Road to AI Safety Excellence','Toon Alfrink','person',NULL,NULL,'https://wiki.lesswrong.com/wiki/Road_to_AI_Safety_Excellence','A proposed course that is designed to produce AI safety researchers.')
    ,('Map of the AI Safety Community','Søren Elverlin','person','2017-09-26','day','https://aisafety.com/2017/09/26/map-ai-safety-community/','A pictorial map that lists organizations and individuals in the AI safety community.')
    ,('LessWrong Wiki','Machine Intelligence Research Institute','organization','2009-03-12','day','https://wiki.lesswrong.com/','A companion wiki to the community blog LessWrong. The wiki has pages about AI safety.')
;
