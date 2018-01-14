create table products(
    product_id int(11) not null auto_increment primary key,
    name varchar(100) not null,
    creation_date date,
    creation_date_precision enum('day','month','year','multi-year'),
    url varchar(200),
    description varchar(2000)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into products(name, creation_date, creation_date_precision, url, description) values
    ('AI Watch','2017-10-23','day','https://aiwatch.issarice.com/','A website to track people and organizations working on AI safety.')
    ,('The Uncertain Future',NULL,NULL,'http://theuncertainfuture.com/','A tool to model future technology and its effect on civilization.')
    ,('AGI Failures Modes and Levels map','2015-01-01','year','http://immortality-roadmap.com/AIfails.pdf','A flowchart about failure modes of artificial general intelligence, grouped by the stage of development. There is an accompanying post on LessWrong at <http://lesswrong.com/lw/mgf/a_map_agi_failures_modes_and_levels/>.')
    ,('AGI Safety Solutions Map','2015-01-01','year','http://immortality-roadmap.com/aisafety.pdf','A flowchart on potential solutions to AI safety. There is an accompanying post on LessWrong at <http://lesswrong.com/lw/mid/agi_safety_solutions_map/>.')
    ,('Road to AI Safety Excellence',NULL,NULL,'https://wiki.lesswrong.com/wiki/Road_to_AI_Safety_Excellence','A proposed course that is designed to produce AI safety researchers.')
    ,('Map of the AI Safety Community','2017-09-26','day','https://aisafety.com/2017/09/26/map-ai-safety-community/','A pictorial map that lists organizations and individuals in the AI safety community.')
    ,('LessWrong Wiki','2009-03-12','day','https://wiki.lesswrong.com/','A companion wiki to the community blog LessWrong. The wiki has pages about AI safety.')
    ,('Intelligent Agent Foundations Forum','2014-11-04','day','https://agentfoundations.org/','A forum for technical AI safety research. The source code is hosted on GitHub <https://github.com/machine-intelligence/research-forum>. The timestamp on the introductory post <https://agentfoundations.org/item?id=1> gives the launch date.')
    ,('Reinforce.js implementation of Stuart Armstrong’s toy control problem','2016-02-03','day','http://www.gwern.net/docs/rl/armstrong-controlproblem/index.html','A live demo of Stuart Armstrong’s toy control problem <http://lesswrong.com/lw/mrp/a_toy_model_of_the_control_problem/>. gwern introduced the demo in a LessWrong comment <http://lesswrong.com/lw/mrp/a_toy_model_of_the_control_problem/d33a>.')
    ,('LessWrong','2009-02-01','month','http://lesswrong.com/','A community blog about rationality, decision theory, AI, updates to MIRI, among other topics.')
    ,('AISafety.com Reading Group','2016-05-24','day','https://aisafety.com/reading-group/','A weekly reading group covering topics in AI safety.')
    ,('AI Safety Discussion','2016-02-21','day','https://www.facebook.com/groups/aisafety/','A Facebook discussion group about AI safety. This is a closed group so one needs to request access to see posts.')
;
