create table agendas (
  agenda_id int(11) not null auto_increment primary key,
  name varchar(200),
  associated_people varchar(2000),
  associated_organizations varchar(2000),
  start_date date,
  start_date_precision enum('day','month','year','multi-year'),
  overview varchar(2000),
  goals varchar(2000),
  ai_timelines_assumptions varchar(2000),
  nature_of_intelligence_assumptions varchar(2000),
  other_assumptions varchar(2000),
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into agendas(name, associated_people, associated_organizations, start_date, start_date_precision, overview, goals, ai_timelines_assumptions, nature_of_intelligence_assumptions, other_assumptions) values
  (
    'Iterated amplification', /* name */
    'Paul Christiano', /* associated_people */
    'OpenAI', /* associated_organizations */
    NULL, /* start_date */
    NULL, /* start_date_precision */
    /* overview */
    /* goals */
    /* ai_timelines_assumptions */
    /* nature_of_intelligence_assumptions */
    /* other_assumptions */
  )
