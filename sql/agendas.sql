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
  other_assumptions varchar(2000)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into agendas(name, associated_people, associated_organizations, start_date, start_date_precision, overview, goals, ai_timelines_assumptions, nature_of_intelligence_assumptions, other_assumptions) values
  (
    'Iterated amplification', /* name */
    'Paul Christiano|Buck Shlegeris|Dario Amodei', /* associated_people */
    'OpenAI', /* associated_organizations */
    NULL, /* start_date */
    NULL, /* start_date_precision */
    '<p>Iterated amplification (also called iterated distillation and amplification) aims to build a powerful aligned AGI by repeatedly invoking two steps: (1) amplification and (2) distillation.</p>
    <ol>
      <li>In the amplification step, a human uses multiple copies of an AGI assistant (who starts out not being very capable) to accomplish some task. The hope is that the combined system of the human with multiple copies of the AGI will be more capable than the human or AGI alone, since the human will be able to delegate tasks to the AGI. This is similar to how a CEO of a company can accomplish much more by hiring and delegating to employees, even if each employee is less capable than the CEO. The combined system of the human with multiple copies of the AGI is called the “amplified system”.</li>
      <li>In the distillation step, an AI is trained using narrow methods (such as imitation learning) to replicate the behavior of the amplified system. The hope is that this “distilled” system will be just as capable as the amplified system while being much less computationally expensive. The distilled system is also supposed to remain aligned (because it was trained using narrow methods). In the next round of amplification/distillation, this distilled system becomes the new AGI assistant.</li>
    </ol>
    <p>One specific version of iterated amplification has been called “imitating expert reasoning” in the <a href="https://arxiv.org/pdf/1811.07871.pdf">reward modeling paper</a> (see also <a href="https://www.alignmentforum.org/posts/HBGd34LKvXM9TxvNf/new-safety-research-agenda-scalable-agent-alignment-via#QeBkcXYFw6ouurZq7">this comment</a>).</p>', /* overview */
    '<p>Iterated amplification intends to build powerful AGI assistants that try to help humans.</p>
    <p>The agenda does not intend to solve all problems, e.g. it doesn’t aim to solve philosophy (although to the extent that humans solving these problems, the AGI assistant would be able to help with them). See <a href="https://www.lesswrong.com/posts/Djs38EWYZG8o7JMWY/paul-s-research-agenda-faq#0__Goals_and_non_goals">“Paul’s research agenda FAQ” § Goals and non-goals</a> for more information.</p>', /* goals */
    '<p>No particular assumptions about AI timelines, as far as I know.</p>', /* ai_timelines_assumptions */
    '<p>Iterated amplification is intended to be able to deal with the case of <a href="https://www.lesswrong.com/posts/YTq4X6inEudiHkHDF/prosaic-ai-alignment">prosaic AGI</a>, i.e. the case where humanity is able to build AGI without learning anything fundamentally new about the nature of intelligence. In other words, iterated amplification works to align scaled-up versions of current machine learning systems.</p>', /* nature_of_intelligence_assumptions */
    '<p>Iterated amplification has some “<a href="https://www.lesswrong.com/posts/HCv2uwgDGf5dyX5y6/preface-to-the-sequence-on-iterated-amplification">key hopes</a>” it is based on:</p>
    <ul>
      <li>If one has an overseer who is smarter than the agent being trained, then it is possible to use the overseer’s judgment as an objective to train the agent.</li>
      <li>It is possible to train a reinforcement learning system using very sparse feedback (so it is fine for the overseer to be computationally expensive).</li>
      <li>A team of aligned agents will be smarter/more capable than any individual agent while remaining aligned.</li>
    </ul>' /* other_assumptions */
  )
  ,(
    'Embedded agency', /* name */
    'Eliezer Yudkowsky|Scott Garrabrant|Abram Demski', /* associated_people */
    'Machine Intelligence Research Institute', /* associated_organizations */
    NULL, /* start_date */
    NULL, /* start_date_precision */
    '', /* overview */
    '', /* goals */
    '', /* ai_timelines_assumptions */
    '', /* nature_of_intelligence_assumptions */
    '' /* other_assumptions */
  )
  ,(
    'Comprehensive AI services', /* name */
    'Eric Drexler', /* associated_people */
    'Future of Humanity Institute', /* associated_organizations */
    NULL, /* start_date */
    NULL, /* start_date_precision */
    '', /* overview */
    '', /* goals */
    '', /* ai_timelines_assumptions */
    '', /* nature_of_intelligence_assumptions */
    '' /* other_assumptions */
  )
  ,(
    'Ambitious value learning', /* name */
    'Stuart Armstrong', /* associated_people */
    'Future of Humanity Institute', /* associated_organizations */
    NULL, /* start_date */
    NULL, /* start_date_precision */
    '', /* overview */
    '', /* goals */
    '', /* ai_timelines_assumptions */
    '', /* nature_of_intelligence_assumptions */
    '' /* other_assumptions */
  )
  ,(
    'Factored cognition', /* name */
    'Andreas Stuhlmüller', /* associated_people */
    'Ought', /* associated_organizations */
    NULL, /* start_date */
    NULL, /* start_date_precision */
    '', /* overview */
    '', /* goals */
    '', /* ai_timelines_assumptions */
    '', /* nature_of_intelligence_assumptions */
    '' /* other_assumptions */
  )
  ,(
    'Recursive reward modeling', /* name */
    'Jan Leike|David Krueger|Tom Everitt|Miljan Martic|Vishal Maini|Shane Legg', /* associated_people */
    'Google DeepMind', /* associated_organizations */
    '2018-11-19', /* start_date; paper and blog post introducing the agenda: https://arxiv.org/abs/1811.07871 https://medium.com/@deepmindsafetyresearch/scalable-agent-alignment-via-reward-modeling-bf4ab06dfd84 */
    'day', /* start_date_precision */
    '<p>Basic reward modeling has two steps:</p>
    <ul>
      <li>The user trains a reward model or reward function to learn their intentions by giving feedback.</li>
      <li>The reward model/reward function is used to train a reinforcement learning agent.</li>
    </ul>
    <p>Recursive reward modeling takes the basic setup, but has another agent trained to help the user give feedback.</p>', /* overview */
    '<p>Reward modeling aims to solve the “agent alignment problem”, which is to produce behavior that is in accordance with the user’s intentions. The agenda only aims to align one AI agent to one user, leaving out the problem of e.g. aggregating different preferences.</p>
    <p>The level of capability of the agent being aligned is not clear from the paper (e.g. is reward modeling intended to be able to align superintelligent AI?).</p>', /* goals */
    '<p>No specific assumptions.</p>', /* ai_timelines_assumptions */
    '<p>No specific assumptions.</p>', /* nature_of_intelligence_assumptions */
    '<p>The reward modeling paper lists two assumptions:</p>
    <ol>
      <li>“We can learn user intentions to a sufficiently high accuracy”</li>
      <li>“For many tasks we want to solve, evaluation of outcomes is easier than producing the correct behavior”</li>
    </ol>' /* other_assumptions */
  )
  ,(
    'Debate', /* name */
    'Paul Christiano', /* associated_people */
    'OpenAI', /* associated_organizations */
    NULL, /* start_date */
    NULL, /* start_date_precision */
    '', /* overview */
    '', /* goals */
    '', /* ai_timelines_assumptions */
    '', /* nature_of_intelligence_assumptions */
    '' /* other_assumptions */
  )
  ,(
    'Interpretability', /* name */
    'Christopher Olah', /* associated_people */
    '', /* associated_organizations */
    NULL, /* start_date */
    NULL, /* start_date_precision */
    '', /* overview */
    '', /* goals */
    '', /* ai_timelines_assumptions */
    '', /* nature_of_intelligence_assumptions */
    '' /* other_assumptions */
  )
  ,(
    'Learning-theoretic AI alignment', /* name */
    'Vanessa Kosoy', /* associated_people */
    '', /* associated_organizations */
    NULL, /* start_date */
    NULL, /* start_date_precision */
    '', /* overview */
    '', /* goals */
    '', /* ai_timelines_assumptions */
    '', /* nature_of_intelligence_assumptions */
    '' /* other_assumptions */
  )
  ,(
    'Inverse reinforcement learning', /* name */
    '', /* associated_people */
    '', /* associated_organizations */
    NULL, /* start_date */
    NULL, /* start_date_precision */
    '', /* overview */
    '', /* goals */
    '', /* ai_timelines_assumptions */
    '', /* nature_of_intelligence_assumptions */
    '' /* other_assumptions */
  )
  ,(
    'Preference learning', /* name */
    '', /* associated_people */
    '', /* associated_organizations */
    NULL, /* start_date */
    NULL, /* start_date_precision */
    '', /* overview */
    '', /* goals */
    '', /* ai_timelines_assumptions */
    '', /* nature_of_intelligence_assumptions */
    '' /* other_assumptions */
  )
  ,(
    'Cooperative inverse reinforcement learning', /* name */
    '', /* associated_people */
    '', /* associated_organizations */
    NULL, /* start_date */
    NULL, /* start_date_precision */
    '', /* overview */
    '', /* goals */
    '', /* ai_timelines_assumptions */
    '', /* nature_of_intelligence_assumptions */
    '' /* other_assumptions */
  )
  ,(
    'Imitation learning', /* name */
    NULL, /* associated_people */
    NULL, /* associated_organizations */
    NULL, /* start_date */
    NULL, /* start_date_precision */
    '<p>The idea with imitation learning is to train agents by imitating human behavior. If the agent imitates the human sufficiently well, its behavior would be aligned. See <a href="https://arxiv.org/pdf/1811.07871.pdf">§7.1 of this paper</a> for more information.</p>', /* overview */
    '<p>With imitation learning, I think the goal is to produce aligned behavior that is as capable as a human (but not more capable). I think this corresponds to the first step of <a href="/?agenda=Iterated+amplification">iterated distillation and amplification</a>, namely distilling the human behavior.</p>', /* goals */
    'No assumptions as far as I can tell.', /* ai_timelines_assumptions */
    NULL, /* nature_of_intelligence_assumptions */
    NULL /* other_assumptions */
  )
  ,(
    'Alignment for advanced machine learning systems', /* name */
    'Jessica Taylor|Eliezer Yudkowsky|Patrick LaVictoire|Andrew Critch', /* associated_people */
    'Machine Intelligence Research Institute', /* associated_organizations */
    '2016-07-27', /* start_date */
    'day', /* start_date_precision */
    'MIRI’s machine learning agenda, announced in a <a href="https://intelligence.org/2016/07/27/alignment-machine-learning/">blog post</a> and detailed in a <a href="https://intelligence.org/files/AlignmentMachineLearning.pdf">paper</a>.', /* overview */
    '', /* goals */
    '', /* ai_timelines_assumptions */
    NULL, /* nature_of_intelligence_assumptions */
    NULL /* other_assumptions */
  )
  ,(
    'Learning-theoretic AI alignment ', /* name */
    'Vanessa Kosoy', /* associated_people */
    NULL, /* associated_organizations */
    '2018-07-04', /* start_date */
    'day', /* start_date_precision */
    'Research agenda by Vanessa Kosoy, announced and explained in a <a href="https://www.lesswrong.com/posts/5bd75cc58225bf0670375575/the-learning-theoretic-ai-alignment-research-agenda">blog post</a> on LessWrong/Alignment Forum.', /* overview */
    '', /* goals */
    '', /* ai_timelines_assumptions */
    NULL, /* nature_of_intelligence_assumptions */
    NULL /* other_assumptions */
  )
;
