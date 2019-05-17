create table documents(
    document_id int(11) not null auto_increment primary key,
    title varchar(100) not null unique,
    url varchar(400) not null unique,
    document_type enum('blog post','wiki page','paper')
    affected_organizations varchar(1000),
    affected_people varchar(2000),
    affected_agendas varchar(1000),
    publication_date date,
    publication_date_precision enum('day','month','year','multi-year'),
    modified_date date,
    modified_date_precision enum('day','month','year','multi-year'),
    publisher varchar(40),
    notes varchar(2000)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


