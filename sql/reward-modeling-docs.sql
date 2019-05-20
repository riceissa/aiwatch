insert into documents(url, title, publication_date, publication_date_precision, modified_date, modified_date_precision, author, document_type, affected_organizations, affected_people, affected_agendas, publisher, notes) values
  (
    'https://arxiv.org/abs/1811.07871', /* url */
    'Scalable agent alignment via reward modeling: a research direction', /* title */
    '2018-11-19', /* publication_date */
    'day', /* publication_date_precision */
    NULL, /* modified_date */
    NULL, /* modified_date_precision */
    'Jan Leike|David Krueger|Tom Everitt|Miljan Martic|Vishal Maini|Shane Legg', /* author */
    'paper', /* document_type */
    'Google DeepMind', /* affected_organizations */
    NULL, /* affected_people */
    'Imitation learning|inverse reinforcement learning|Cooperative inverse reinforcement learning|myopic reinforcement learning|imitating expert reasoning|debate', /* affected_agendas */
    'arXiv', /* publisher */
    'This paper introduces the (recursive) reward modeling agenda, discussing its basic outline, challenges, and ways to overcome those challenges. The paper also discusses alternative agendas.' /* notes */
  )
;
