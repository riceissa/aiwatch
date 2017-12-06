<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <meta name="dcterms.date" content="2017-12-05">
  <meta property="og:title" content="About" />
  <meta property="og:site_name" content="AI Watch" />
  <meta property="og:locale" content="en_US" />
  <title>About - AI Watch</title>
  <script src="/anchor.min.js"></script>
<?php include_once("../style.inc"); ?>
<?php include_once("../analytics.inc"); ?>
</head>
<body>
<nav>
  <a href="/">Home</a>,
  <a href="/about/">About</a>
</nav>

<h1>About</h1>

<p>AI Watch is a website to track people and organizations working on
  AI safety.</p>

<h2>Inclusion criteria</h2>

<p>The site is new and is still under active development, so there are
  no hard criteria for including people or organizations on this site.
  Generally what I look for are explicit statement of interest in AI
  safety/risk/alignment, or someone with an explicit interest claiming
  relevance to safety work.</p>

<h2>How the site was built</h2>

<p>The site is built using PHP for the interface and logic and MySQL
  for the database. The site design is influenced by Vipul Naik’s
  websites. You can find
  the <a href="https://github.com/riceissa/aiwatch">Git repository on
    GitHub</a> which has all the code and data.</p>

<p>So far, all of the development is done by Issa Rice.</p>

<p>Funding is provided by <a href="https://contractwork.vipulnaik.com/tasks.php?receptacle=AI+Watch&amp;matching=exact">Vipul Naik</a>.
  That page only covers task payment. The site is developed under work time for Vipul, which is funded by a stipend as well. The stipend payment for AI Watch can be calculated as a percentage of the total stipend depending on how much time I have spent working on this site. Development on Vipul’s time is limited to one day per week (for several more weeks). I will add a calculation here at some point.</p>

<p>Finding people/positions to add to the site was an informal process.</p>

<h2>What the site is still missing</h2>

<p>The main AI safety organizations are covered, so the missing people
  are mostly individual researchers, people who used to work at these
  organizations, and also interns (which most organizations don’t list
  on their team pages).</p>

<p>I have a list of people I want to add which I will get to soon. (I won’t bother with making that public for now, as I will get to it soon enough.)</p>

<p>Eventually I would like to add more features to the site like graphs but for now I am mostly just adding data (which will make the graphs more interesting).</p>

<p>I am also considering adding more tables to the database. Currently I have people, organizations, and positions. But I could also track documents, tools (e.g. websites, software), etc.</p>

<h2>Update strategy</h2>

<p>I don't think there is any single place to look for to find
  additions to this site (which is part of why I wanted to make this
  site in the first place). Some places to look are:</p>

<ul>
  <li>Organizations’ blogs or social media updates (for updates about
    that organization’s team members)</li>
  <li><a href="https://www.reddit.com/r/ControlProblem/">r/ControlProblem</a></li>
  <li>Some AI safety Facebook groups</li>
  <li>LessWrong</li>
</ul>

<h2>History</h2>

<p>Development for the site began on October 23, 2017.</p>

<h2>Feedback</h2>

<p>If you have feedback for the site, email Issa at riceissa@gmail.com. All feedback including praise, criticism, concerns, thoughts on the usability of the site, feature requests, people or positions that should be added, are appreciated.</p>

<script>
    anchors.add();
</script>
</body>
</html>
