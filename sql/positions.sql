create table positions(
    position_id int(11) not null auto_increment primary key,
    researcher varchar(40) not null,
    organization varchar(200) not null,
    title varchar(100),
    start_date date,
    start_date_precision enum('day','month','year','multi-year'),
    end_date date,
    end_date_precision enum('day','month','year','multi-year'),
    urls varchar(2000),
    notes varchar(2000) default null
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into positions(researcher, organization, title, start_date, start_date_precision, end_date, end_date_precision, urls, notes) values
    ('Andrej Karpathy','OpenAI','Research Scientist','2016-01-01','year','2017-06-01','month','http://cs.stanford.edu/people/karpathy/ https://archive.is/37L6s','The given description is " Deep Learning, Generative Models, Reinforcement Learning"')
    ,('Eliezer Yudkowsky','Machine Intelligence Research Institute','Senior Research Fellow',NULL,NULL,NULL,NULL,'https://intelligence.org/team/',NULL)
    ,('Alex Altair','Machine Intelligence Research Institute','Research Associate',NULL,NULL,NULL,NULL,'https://web.archive.org/web/20140209055438/http://intelligence.org/team/',NULL)
    ,('Mihaly Barasz','Machine Intelligence Research Institute','Research Associate',NULL,NULL,NULL,NULL,'https://web.archive.org/web/20140209055438/http://intelligence.org/team/',NULL)
    ,('Paul Christiano','Machine Intelligence Research Institute','Research Associate',NULL,NULL,NULL,NULL,'https://web.archive.org/web/20140209055438/http://intelligence.org/team/',NULL)
    ,('Daniel Dewey','Machine Intelligence Research Institute','Research Associate',NULL,NULL,NULL,NULL,'https://web.archive.org/web/20140209055438/http://intelligence.org/team/',NULL)
    ,('Benja Fallenstein','Machine Intelligence Research Institute','Research Associate',NULL,NULL,NULL,NULL,'https://web.archive.org/web/20140209055438/http://intelligence.org/team/',NULL)
    ,('Marcello Herreshoff','Machine Intelligence Research Institute','Research Associate',NULL,NULL,NULL,NULL,'https://web.archive.org/web/20140209055438/http://intelligence.org/team/',NULL)
    ,('Bill Hibbard','Machine Intelligence Research Institute','Research Associate',NULL,NULL,NULL,NULL,'https://web.archive.org/web/20140209055438/http://intelligence.org/team/',NULL)
    ,('Patrick LaVictoire','Machine Intelligence Research Institute','Research Associate',NULL,NULL,NULL,NULL,'https://web.archive.org/web/20140209055438/http://intelligence.org/team/',NULL)
    ,('Nate Soares','Machine Intelligence Research Institute','Research Associate',NULL,NULL,NULL,NULL,'https://web.archive.org/web/20140209055438/http://intelligence.org/team/',NULL)
    ,('Kaj Sotala','Machine Intelligence Research Institute','Research Associate',NULL,NULL,NULL,NULL,'https://web.archive.org/web/20140209055438/http://intelligence.org/team/',NULL)
    ,('Nisan Stiennon','Machine Intelligence Research Institute','Research Associate',NULL,NULL,NULL,NULL,'https://web.archive.org/web/20140209055438/http://intelligence.org/team/',NULL)
    ,('Paul Christiano','OpenAI',NULL,'2017-01-01','month',NULL,NULL,'https://paulfchristiano.com/ai/ https://archive.is/Tcqbl','The description given is "working on alignment"')
    ,('Yura Burda','OpenAI',NULL,'2016-03-31','year',NULL,NULL,'https://blog.openai.com/team-plus-plus/ https://web.archive.org/web/20171024174215/https://blog.openai.com/team-plus-plus/',NULL)
    ,('Ian Goodfellow','OpenAI',NULL,'2016-03-31','year',NULL,NULL,'https://blog.openai.com/team-plus-plus/ https://web.archive.org/web/20171024174215/https://blog.openai.com/team-plus-plus/',NULL)
    ,('Alec Radford','OpenAI',NULL,'2016-03-31','year',NULL,NULL,'https://blog.openai.com/team-plus-plus/ https://web.archive.org/web/20171024174215/https://blog.openai.com/team-plus-plus/',NULL)
    ,('Tim Salimans','OpenAI',NULL,'2016-03-31','year',NULL,NULL,'https://blog.openai.com/team-plus-plus/ https://web.archive.org/web/20171024174215/https://blog.openai.com/team-plus-plus/',NULL)
    ,('Peter Chen','OpenAI','Intern','2016-03-31','year',NULL,NULL,'https://blog.openai.com/team-plus-plus/ https://web.archive.org/web/20171024174215/https://blog.openai.com/team-plus-plus/',NULL)
    ,('Rocky Duan','OpenAI','Intern','2016-03-31','year',NULL,NULL,'https://blog.openai.com/team-plus-plus/ https://web.archive.org/web/20171024174215/https://blog.openai.com/team-plus-plus/',NULL)
    ,('Linxi Fan','OpenAI','Intern','2016-03-31','year',NULL,NULL,'https://blog.openai.com/team-plus-plus/ https://web.archive.org/web/20171024174215/https://blog.openai.com/team-plus-plus/',NULL)
    ,('Jon Gauthier','OpenAI','Intern','2016-03-31','year',NULL,NULL,'https://blog.openai.com/team-plus-plus/ https://web.archive.org/web/20171024174215/https://blog.openai.com/team-plus-plus/',NULL)
    ,('Jonathan Ho','OpenAI','Intern','2016-03-31','year',NULL,NULL,'https://blog.openai.com/team-plus-plus/ https://web.archive.org/web/20171024174215/https://blog.openai.com/team-plus-plus/',NULL)
    ,('Rein Houthooft','OpenAI','Intern','2016-03-31','year',NULL,NULL,'https://blog.openai.com/team-plus-plus/ https://web.archive.org/web/20171024174215/https://blog.openai.com/team-plus-plus/',NULL)
    ,('Eric Price','OpenAI','Intern','2016-03-31','year',NULL,NULL,'https://blog.openai.com/team-plus-plus/ https://web.archive.org/web/20171024174215/https://blog.openai.com/team-plus-plus/',NULL)
;
