create table organization_documents (
  organization_document_id int(11) not null auto_increment primary key,
  url varchar(200),
  title varchar(200),
  publication_date date,
  modified_date date,
  author varchar(200),
  publisher varchar(40),
  affected_organizations varchar(1000),
  affected_people varchar(1000),
  document_scope enum('Job application experience', 'Hiring-related notice', 'Successful hire', 'Employee departure', 'Job experience', 'Job market commentary', 'HR controversy', 'Organizational growth introspection', 'New board member notice', 'Board member departure', 'Third-party commentary on organization', 'Organizational mistake postmortem'),
  cause_area varchar(200),
  notes varchar(2000),
  unique key url(`url`)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
