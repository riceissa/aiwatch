create table document_authors(
    document_author_id int(11) not null auto_increment primary key,
    author varchar(100),
    url varchar(40),
    kind enum('person','organization')
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
