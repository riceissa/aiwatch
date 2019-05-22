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
    'Recursive reward modeling|Imitation learning|inverse reinforcement learning|Cooperative inverse reinforcement learning|myopic reinforcement learning|iterated amplification|debate', /* affected_agendas */
    'arXiv', /* publisher */
    'This paper introduces the (recursive) reward modeling agenda, discussing its basic outline, challenges, and ways to overcome those challenges. The paper also discusses alternative agendas and their relation to reward modeling.' /* notes */
  )
  ,(
    'https://www.lesswrong.com/posts/HBGd34LKvXM9TxvNf/new-safety-research-agenda-scalable-agent-alignment-via', /* url */
    'New safety research agenda: scalable agent alignment via reward modeling', /* title */
    '2018-11-20', /* publication_date */
    'day', /* publication_date_precision */
    NULL, /* modified_date */
    NULL, /* modified_date_precision */
    'Victoria Krakovna', /* author */
    'blog post', /* document_type */
    'Google DeepMind', /* affected_organizations */
    'Jan Leike', /* affected_people */
    'Recursive reward modeling|iterated amplification', /* affected_agendas */
    'LessWrong', /* publisher */
    'Blog post on LessWrong announcing the recursive reward modeling agenda. Some comments in the discussion thread clarify various aspects of the agenda, including its relation to Paul Christiano’s iterated amplification agenda, whether the DeepMind safety team is thinking about the problem of whether the human user is a safe agent, and more details about alternating quantifiers in the analogy to complexity theory.' /* notes */
  )
;
