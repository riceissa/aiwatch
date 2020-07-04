create table positions(
    position_id int(11) not null auto_increment primary key,
    person varchar(40) not null,
    organization varchar(200),

    # The title is whatever the organization decides to call it, and
    # is not normalized.  For a more normalized take on the kind of
    # position, see the ai_safety_relation and position_type columns
    # of this same table.
    title varchar(160),

    start_date date,
    start_date_precision enum('day','month','year','multi-year'),

    end_date date,
    end_date_precision enum('day','month','year','multi-year'),

    urls varchar(2000),

    # On what basis do we know this position has anything to do with AI safety?
    # Here 'position' means the position itself has to do with safety or the
    # organization exclusively focuses on AI safety so we know it's a
    # safety-related position,
    # 'organization' means the organization has some relation to AI safety
    # (although the organization might do a bunch of other things) e.g. the
    # organization aims to develop an artificial general intelligence and has
    # voiced safety concerns, or the organization focuses on global catastrophic
    # risks and considers unaligned AI a global catastrophic risk, so the
    # position might have some relation to safety (although we as outsiders
    # cannot be sure -- if we knew for sure, this would be set to 'position'),
    # and 'unrelated' means the
    # position doesn't have to do with safety (but we include it anyway
    # because we want to track movement in and out of safety).
    ai_safety_relation enum('position','AGI organization','GCR organization','unrelated'),

    # 'background' is the kind of background historical trends or
    # AI timelines work that e.g. AI Impacts does.
    subject enum('technical research','software engineering','background','popularization','general','policy','scientific advising','grant investigation','strategy'),

    employment_type enum('full-time','part-time','contractor','intern','undergraduate student','graduate student','postdoc','board member','associate','advisor','volunteer'),
    cause_area enum('AI safety','Global health and poverty','Effective altruism','Animal welfare','Cause prioritization'),
    notes varchar(2000) default null
) ENGINE=InnoDB AUTO_INCREMENT=15239276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
