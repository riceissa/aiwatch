create table tools(
    tool_id int(11) not null auto_increment primary key,
    tool_name varchar(40) not null,
    creator varchar(40),
    creator_type enum('person','organization'),
    creation_date date,
    url varchar(200),
    description varchar(2000)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into tools(tool_name, creator, creator_type, creation_date, url, description) values
    ('AI Watch','Issa Rice','person','2017-10-23','https://aiwatch.issarice.com/','A website to track people and organizations working on AI safety.')
;
