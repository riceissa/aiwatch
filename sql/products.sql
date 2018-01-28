create table products(
    product_id int(11) not null auto_increment primary key,
    name varchar(100) not null,
    product_type enum('blog','wiki','list','flowchart','graphic','discussion group','course','interactive application'),
    creation_date date,
    creation_date_precision enum('day','month','year','multi-year'),
    url varchar(200),
    description varchar(2000)
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into products(name, product_type, creation_date, creation_date_precision, url, description) values
    ('AI Watch','interactive application','2017-10-23','day','https://aiwatch.issarice.com/','A website to track people and organizations working on AI safety.')
    ,('The Uncertain Future','interactive application','2009-10-01','month','http://theuncertainfuture.com/','A tool to model future technology and its effect on civilization. For more about the history of the site, see <https://timelines.issarice.com/wiki/Timeline_of_Machine_Intelligence_Research_Institute>.')
    ,('AGI Failures Modes and Levels map','flowchart','2015-01-01','year','http://immortality-roadmap.com/AIfails.pdf','A flowchart about failure modes of artificial general intelligence, grouped by the stage of development. There is an accompanying post on LessWrong at <http://lesswrong.com/lw/mgf/a_map_agi_failures_modes_and_levels/>.')
    ,('AGI Safety Solutions Map','flowchart','2015-01-01','year','http://immortality-roadmap.com/aisafety.pdf','A flowchart on potential solutions to AI safety. There is an accompanying post on LessWrong at <http://lesswrong.com/lw/mid/agi_safety_solutions_map/>.')
    ,('“Levels of defense” in AI safety','flowchart','2017-12-12','day','https://drive.google.com/file/d/11M9LlyQDPHrYBOsS3aCp6wotqa7iqTQg/view','A flowchart applying multilevel defense to AI safety. There is an accompanying post on LessWrong at <https://www.lesserwrong.com/posts/qAtgNeRHeHrcFLmcA/the-map-of-levels-of-defence-in-ai-safety>.')
    ,('Road to AI Safety Excellence','course','2017-06-15','day','https://wiki.lesswrong.com/wiki/Road_to_AI_Safety_Excellence','A proposed course that is designed to produce AI safety researchers. It used to be called “Accelerating AI Safety Adoption in Academia” and was announced on LessWrong at <http://lesswrong.com/r/discussion/lw/p5e/announcing_aasaa_accelerating_ai_safety_adoption/>. The Facebook group was created on 2017-06-30 <https://www.facebook.com/groups/AISafetyExcellence/permalink/1421511674564109/>.')
    ,('Map of the AI Safety Community','graphic','2017-09-26','day','https://aisafety.com/2017/09/26/map-ai-safety-community/','A pictorial map that lists organizations and individuals in the AI safety community.')
    ,('LessWrong Wiki','wiki','2009-03-12','day','https://wiki.lesswrong.com/','A companion wiki to the community blog LessWrong. The wiki has pages about AI safety.')
    ,('Intelligent Agent Foundations Forum','discussion group','2014-11-04','day','https://agentfoundations.org/','A forum for technical AI safety research. The source code is hosted on GitHub <https://github.com/machine-intelligence/research-forum>. The timestamp on the introductory post <https://agentfoundations.org/item?id=1> gives the launch date.')
    ,('Reinforce.js implementation of Stuart Armstrong’s toy control problem','interactive application','2016-02-03','day','http://www.gwern.net/docs/rl/armstrong-controlproblem/index.html','A live demo of Stuart Armstrong’s toy control problem <http://lesswrong.com/lw/mrp/a_toy_model_of_the_control_problem/>. gwern introduced the demo in a LessWrong comment <http://lesswrong.com/lw/mrp/a_toy_model_of_the_control_problem/d33a>.')
    ,('LessWrong','blog','2009-02-01','month','http://lesswrong.com/','A community blog about rationality, decision theory, AI, updates to MIRI, among other topics.')
    ,('AISafety.com Reading Group','discussion group','2016-05-24','day','https://aisafety.com/reading-group/','A weekly reading group covering topics in AI safety.')
    ,('AI Safety Discussion','discussion group','2016-02-21','day','https://www.facebook.com/groups/aisafety/','A Facebook discussion group about AI safety. This is a closed group so one needs to request access to see posts.')
    ,('AI Safety Open Discussion','discussion group','2017-10-23','day','https://www.facebook.com/groups/aisafetyopen/','A Facebook discussion group about AI safety. This is an open group.')
    ,('A flowchart of AI safety considerations','flowchart','2014-11-02','day','https://www.facebook.com/groups/674486385982694/permalink/675425535888779/','The flowchart was posted to Eliezer Yudkowsky’s Essays (a Facebook group) and has no title.')
    ,('Annotated bibliography of recommended materials','list','2016-12-01','month','http://humancompatible.ai/bibliography','An annotated and interactive bibliography of AI safety-related course materials, textbooks, videos, papers, etc.')
    ,('Introductory resources on AI safety research','list','2016-02-28','day','https://vkrakovna.wordpress.com/2016/02/28/introductory-resources-on-ai-safety-research/','A list of readings on long-term AI safety. Mirrored at <https://futureoflife.org/2016/02/29/introductory-resources-on-ai-safety-research/>. There is an updated list at <https://vkrakovna.wordpress.com/ai-safety-resources/>.')
    ,('AI safety resources','list','2017-10-01','month','https://vkrakovna.wordpress.com/ai-safety-resources/','A list of resources for long-term AI safety. Seems to have been first announced at <https://www.facebook.com/groups/aisafetyopen/permalink/126709148032120/>.')
    ,('Ordinary Ideas','blog','2011-12-21','day','https://ordinaryideas.wordpress.com/','Paul Christiano’s blog about “weird AI stuff” <https://paulfchristiano.com/blogs/>.')
    ,('AI Alignment','blog','2016-05-28','day','https://ai-alignment.com/','Paul Christiano’s blog about AI alignment.')
    ,('Arbital AI alignment domain','wiki',NULL,NULL,'https://arbital.com/explore/ai_alignment/','A collection of wiki-like pages on topics in AI alignment.')
    ,('AI Policies Wiki','wiki','2015-12-14','day','http://wiki.aipolicies.org/','A wiki on AI policy. The wiki creation date can be seen in the revision history of the main page <http://wiki.aipolicies.org/action/info/FrontPage?action=info>.')
    ,('How to study superintelligence strategy','list','2014-07-03','day','http://lukemuehlhauser.com/some-studies-which-could-improve-our-strategic-picture-of-superintelligence/','A list of project ideas in superintelligence strategy.')
    ,('Effective Altruism Forum','blog','2014-09-10','day','http://effective-altruism.com/','A community blog about effective altruism which often has posts about AI safety. The forum was announced on LessWrong by Ryan Carey <http://lesswrong.com/lw/ku2/announcing_the_effective_altruism_forum/>.')
    ,('The Control Problem','discussion group','2015-08-29','day','https://www.reddit.com/r/ControlProblem/','A subreddit about AI safety and control. For the subreddit creation date, see <https://www.reddit.com/r/ControlProblem/about/moderators>.')
    ,('Cause prioritization app','interactive application','2016-05-18','day','http://mdickens.me/causepri-app/','An interactive app for quantitative cause prioritization. The app includes a section <http://mdickens.me/causepri-app/#7> on AI safety intervention. The creation date is the date of the first commit in the Git repository <https://github.com/bshlgrs/mega-michael-madness/commits/master?after=36ca2544a46e109ae68da6d2db054b9e728a99b5+104>.')
;
