-- p1 query
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

-- p2 query
select organization, last_major_data_update_date from organizations
where organization in (
  '80,000 Hours',
  'Animal Charity Evaluators',
  'Berkeley Existential Risk Initiative',
  'Center for Applied Rationality',
  'Center on Long-Term Risk',
  'Future of Humanity Institute'
) and (last_major_data_update_date is null or datediff(curdate(), last_major_data_update_date) > 365)
order by last_major_data_update_date;

-- p3 query
select organization, last_major_data_update_date from organizations
where organization in (
  'Center for Human-Compatible AI',
  'Center for Security and Emerging Technology',
  'Future of Life Institute',
  'Longview Philanthropy',
  'Median Group',
  'OpenAI',
  'Theiss Research'
) and (last_major_data_update_date is null or datediff(curdate(), last_major_data_update_date) > 548)
order by last_major_data_update_date;

-- p4 query
select organization, last_major_data_update_date from organizations
where organization in (
  'FLOWERS',
  'Leverage Research',
  'Methuselah Foundation',
  'SENS Research Foundation',
  'Sentience Institute',
  'Sentience Politics'
) and (last_major_data_update_date is null or datediff(curdate(), last_major_data_update_date) > 730)
order by last_major_data_update_date;

-- p5 query
select organization, last_major_data_update_date from organizations
where organization in (
  'Abdul Latif Jameel Poverty Action Lab',
  'Against Malaria Foundation',
  'Albert Schweitzer Foundation',
  'Center for Global Development',
  'Charity Science', -- NOTE: This org does not currently have a row in organizations.sql so make sure to add that row first
  'Give Directly',
  'Innovations for Poverty Action',
  'Johns Hopkins Center for Health Security',
  'Lifespan Extension Advocacy Foundation',
  'Mercy For Animals',
  'New Incentives',
  'SCI Foundation',
  'Suvita',
  'The Good Food Institute',
  'The Humane League'
) and (last_major_data_update_date is null or datediff(curdate(), last_major_data_update_date) > 1461)
order by last_major_data_update_date;
