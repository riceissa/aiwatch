-- Highest priority orgs (p1)
-- Goal is that last_major_data_update_date should be at most half a year old
-- This includes leading orgs working in AI safety, effective altruism meta,
-- and the biggest grantmakers / grant influencers
select organization, last_major_data_update_date from organizations
where organization in (
  'AI Impacts',
  'Centre for Effective Altruism',
  'GiveWell',
  'Lightcone Infrastructure',
  'Machine Intelligence Research Institute',
  'Open Philanthropy'
) and (last_major_data_update_date is null or datediff(curdate(), last_major_data_update_date) > 183)
order by last_major_data_update_date;

-- Second-highest priority orgs (p2)
-- Goal is that last_major_data_update_date should be at most a year old
-- This includes orgs working in AI safety or other GCRs, including orgs
-- that play a supporting role; it also includes evaluator and EA meta orgs;
-- by and large, we avoid putting very large orgs at p2
select organization, last_major_data_update_date from organizations
where organization in (
  '80,000 Hours',
  'Alignment Research Center',
  'Animal Charity Evaluators',
  'Berkeley Existential Risk Initiative',
  'Center for Applied Rationality',
  'Center on Long-Term Risk',
  'Future of Humanity Institute',
  'Ought',
  'Redwood Research'
) and (last_major_data_update_date is null or datediff(curdate(), last_major_data_update_date) > 365)
order by last_major_data_update_date;

-- Third-highest priority orgs (p3)
-- Goal is that last_major_data_update_date should be at most 1.5 years old
-- This includes orgs working in AI safety and other GCRS, including orgs
-- that play a supporting role; the main distinction between p2 and p3
-- is that p2 orgs tend to be some combination of smaller and more important
select organization, last_major_data_update_date from organizations
where organization in (
  'Anthropic', -- this is a small org right now in Org Watch, but is expected to have grown quite a bit and is expected to continue to grow more
  'Center for AI Safety',
  'Center for Human-Compatible AI',
  'Center for Security and Emerging Technology',
  'Conjecture',
  'Cooperative AI Foundation',
  'Effective Altruism Funds',
  'Epoch',
  'Fund for Alignment Research', -- consider renaming to FAR AI as they've rebranded as that
  'Future of Life Institute',
  'General AI Challenge',
  'Global Catastrophic Risk Institute',
  'GoodAI',
  'Google DeepMind',
  'Leverhulme Centre for the Future of Intelligence',
  'Longview Philanthropy',
  'Median Group',
  'Nonlinear Fund', -- consider rebranding to Nonlinear as they seem to have rebranded to remove the "Fund" from their org name
  'OpenAI',
  'Theiss Research'
) and (last_major_data_update_date is null or datediff(curdate(), last_major_data_update_date) > 548)
order by last_major_data_update_date;

-- Fourth-highest priority orgs (p4)
-- Goal is that last_major_data_update_date should be at most 2 years old
-- This includes orgs further down than p3 in importance or bigger in size;
-- it mostly doesn't include AI safety orgs as those are p3 or higher;
-- however, it does include other GCR orgs, EA meta, and the smaller animal welfare meta orgs
select organization, last_major_data_update_date from organizations
where organization in (
  'Alvea',
  'Centre for the Study of Existential Risk',
  'FLOWERS',
  'Forethought Foundation for Global Priorities Research',
  'Foundational Research Institute',
  'Giving What We Can',
  'Happier Lives Institute',
  'Legal Priorities Project',
  'Leverage Research',
  'Metaculus',
  'Methuselah Foundation',
  'Raising for Effective Giving',
  'Rethink Charity',
  'Rethink Priorities',
  'SENS Research Foundation',
  'Sentience Institute',
  'Sentience Politics',
  'Simon Institute',
  'The Centre for Long-Term Resilience'
) and (last_major_data_update_date is null or datediff(curdate(), last_major_data_update_date) > 730)
order by last_major_data_update_date;

-- Fifth-highest priority orgs (p5)
-- Goal is that last_major_data_update_date should be at most 4 years old
-- This includes orgs in object-level (not meta) areas prioritized in EA,
-- and is limited to orgs with fewer than 150 people
select organization, last_major_data_update_date from organizations
where organization in (
  'Against Malaria Foundation',
  'Albert Schweitzer Foundation',
  'Animal Advocacy Africa',
  'Charity Science Health',
  'Charity Science', -- NOTE: This org does not currently have a row in organizations.sql so make sure to add that row first
  'Effective Altruism Foundation',
  'Effective Altruism Geneva',
  'Fish Welfare Initiative',
  'Generation Pledge',
  'High Impact Medicine',
  'Johns Hopkins Center for Health Security',
  'LEV Foundation',
  'Lifespan Extension Advocacy Foundation',
  'One for the World',
  'SCI Foundation',
  'Suvita',
  'Wild Animal Initiative'
) and (last_major_data_update_date is null or datediff(curdate(), last_major_data_update_date) > 1461)
order by last_major_data_update_date;

-- p6 query
-- Goal is that last_major_data_update_date should be at most 8 years old
-- This includes a large org (100+ people, usually 150+ people) that are impractical to update
-- and are not super-interesting to us
select organization, last_major_data_update_date from organizations
where organization in (
  'Abdul Latif Jameel Poverty Action Lab',
  'Center for Global Development',
  'Give Directly',
  'Innovations for Poverty Action',
  'Mercy For Animals',
  'New Incentives',
  'The Good Food Institute',
  'The Humane League'
) and (last_major_data_update_date is null or datediff(curdate(), last_major_data_update_date) > 2922)
order by last_major_data_update_date;
