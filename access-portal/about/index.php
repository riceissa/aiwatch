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
  <link rel="stylesheet" href="/tablesorter.css">
  <script src="/jquery.min.js"></script>
  <script src="/jquery.tablesorter.js"></script>
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

<p>AI Watch is a website to track people, organizations, products (tools,
  websites, etc.), and (in the future) other aspects of AI safety.</p>

<h2>Inclusion criteria</h2>

<p>The site is new and is still under active development, so at the moment there are
  no firm criteria for inclusion on this site. With that said, below I describe
  my best guesses for what should be included and my current decision procedure.</p>

<h3>People</h3>

<p>Generally I look for public output that is related to AI
safety/risk/alignment. This could be academic papers, books, blog posts,
flowcharts, Facebook posts, web pages, wiki pages, substantive comments to
existing blog posts, and so on. I also pay attention to how often names appear
in discussions (e.g. on Facebook or LessWrong) as well as inclusion in lists of
e.g. participation in relevant workshops or other lists of people relevant to
AI safety.</p>

<p>So far I have been adding people who perform general work like office management, even though if they did the exact same work at an organization that didn’t work on AI safety, they wouldn’t have been added. I am not sure if this is ideal and might change that at some point.</p>

<p>I have been excluding funders because I hope these will be covered in Vipul
  Naik’s <a href="https://donations.vipulnaik.com/?cause_area_filter=AI+risk">Donations
  List Website</a> (the site already tracks some donations and other funding,
  but data is preliminary).</p>

<p>I am not sure what the most “useful” (in terms of how useful people will
find this website) criteria for inclusion are. It seems like writing a couple
of blog posts is a fairly low bar, and might turn out to be so low that I can’t
keep up with adding everyone, or that the list feels diluted. So far this
doesn’t seem to be the case though, and with proper tagging the dilution issue
can be mitigated.</p>

<h3>Organizations</h3>

<p>I look for explicit statement of interest in AI safety/risk/alignment
(hopefully with some actual output), or someone with an explicit interest
claiming relevance to safety work.</p>

<p>If an organization is about global catastrophic risks, I try to find the specific people from the organization who work on AI safety. If that is not possible I add everyone, for the sake of inclusiveness.</p>

<p>Similarly, if an organization is about building an AGI and I can identify the specific people within the organization who work on safety, I try to add only those people. Otherwise I just add everyone.</p>

<h3>Products</h3>

<p>So far I have been adding products that I have seen in the past and am able
to remember. As long as the product is somewhat usable, useful, and polished, I
have been adding all the ones I could think of.</p>

<h2>How the site was built</h2>

<p>The site is built using PHP for the interface and logic and MySQL
  for the database. The site design is influenced by Vipul Naik’s
  websites (e.g. his <a href="https://donations.vipulnaik.com/">Donations List Website</a>). You can find
  the <a href="https://github.com/riceissa/aiwatch">Git repository on
    GitHub</a>, which has all the code and data.</p>

<p>So far, all of the development is done by Issa Rice.</p>

<p>Funding is provided by <a href="https://contractwork.vipulnaik.com/tasks.php?receptacle=AI+Watch&amp;matching=exact">Vipul Naik</a>.
  That page only covers task payment. The site is developed under work time for Vipul, which is funded by a stipend as well. The stipend payment for AI Watch can be calculated as a percentage of the total stipend depending on how much time I have spent working on this site. Development on Vipul’s time is limited to one day per week (for several more weeks). I will add a calculation here at some point.</p>

<p>Finding people/positions to add to the site was an informal process.</p>

<h2>What the site is still missing</h2>

<p>The main AI safety organizations are covered, so the missing people
  are mostly individual researchers, people who used to work at these
  organizations, and also interns (which most organizations don’t list
  on their team pages). I also haven’t added a lot of the start/end dates for positions, since these are difficult to find.</p>

<p>I have a private list of people I want to add which I will get to soon. (I won’t bother with making that public for now, as I will get to it soon enough.)</p>

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

<p>If you have feedback for the site, email Issa at riceissa@gmail.com. You can also <a href="https://github.com/riceissa/aiwatch/issues">add an issue</a> on the GitHub repository.
  All feedback including praise, criticism, concerns, thoughts on the usability of the site, feature requests, and people or positions that should be added, are appreciated.</p>

<h2>Positions</h2>

<p>
  The <code>positions</code> table in the AI Watch database has a
  field describing the relation of the position to safety
  (<code>ai_safety_relation</code>), and another field describing the
  type of work (<code>subject</code>).  Combining these two
  fields gives a more intuitive idea of what the position is about, so
  the table below gives the possible combinations and what that means
  for the position.
</p>

<table>
  <thead>
    <th>AI safety relation</th>
    <th>Subject</th>
    <th>Meaning</th>
    <th>Example</th>
  </thead>
  <tbody>
<tr>
  <td>Position</td> <td>Technical research</td> <td>This is a technical position that is related to AI safety in virtue of the position, so this is a technical safety research position.</td> <td>Nate Soares’s work at MIRI</td>
</tr>
<tr>
  <td>Position</td> <td>General</td> <td>This is a general position that we specifically know has to do with safety. An office management or general writing position at an organization that specifically works on AI safety counts. Since this is a general position, if the same sort of work was done at an organization that doesn’t do any AI safety work, it would’t be considered AI safety work.</td> <td>Aaron Silverbook’s work at MIRI.</td>
</tr>
<tr>
</tr>
  <td>Position</td> <td>Policy</td> <td>This is an AI safety policy position.</td>
</tr>
<tr>
  <td>Position</td> <td></td> <td></td>
</tr>
<tr>
  <td>Position</td> <td></td> <td></td>
</tr>
<tr>
  <td>Position</td> <td></td> <td></td>
</tr>
<tr>
  <td>Position</td> <td></td> <td></td>
</tr>

<tr>
  <td>AGI organization</td> <td>Technical research</td> <td>This is a technical position at an organization that (1) aims to develop artificial general intelligence and (2) has voiced interest in safety concerns. However, since the organization doesn’t exclusively focus on AI safety, we don’t know if the position is safety-related or not.</td>
</tr>
<tr>
  <td>AGI organization</td> <td></td> <td></td>
</tr>
<tr>
  <td>AGI organization</td> <td></td> <td></td>
</tr>
<tr>
  <td>AGI organization</td> <td></td> <td></td>
</tr>
<tr>
  <td>AGI organization</td> <td></td> <td></td>
</tr>
<tr>
  <td>AGI organization</td> <td></td> <td></td>
</tr>
<tr>
  <td>AGI organization</td> <td></td> <td></td>
</tr>

<tr>
  <td>GCR organization</td> <td>Technical research</td> <td>This is a technical position at an organization that (1) focuses on existential risks or global catastrophic risks and (2) has given unaligned AI as a potential global catastrophic risk. However, since the organization doesn’t exclusively focus on AI safety, we don’t know if the position is safety-related or not.</td>
</tr>
<tr>
  <td>GCR organization</td> <td></td> <td></td>
</tr>
<tr>
  <td>GCR organization</td> <td></td> <td></td>
</tr>
<tr>
  <td>GCR organization</td> <td></td> <td></td>
</tr>
<tr>
  <td>GCR organization</td> <td></td> <td></td>
</tr>
<tr>
  <td>GCR organization</td> <td></td> <td></td>
</tr>
<tr>
  <td>GCR organization</td> <td></td> <td></td>
</tr>

<tr>
  <td>Unrelated</td> <td></td> <td></td>
</tr>
<tr>
  <td>Unrelated</td> <td></td> <td></td>
</tr>
<tr>
  <td>Unrelated</td> <td></td> <td></td>
</tr>
<tr>
  <td>Unrelated</td> <td></td> <td></td>
</tr>
<tr>
  <td>Unrelated</td> <td></td> <td></td>
</tr>
<tr>
  <td>Unrelated</td> <td></td> <td></td>
</tr>
<tr>
  <td>Unrelated</td> <td></td> <td></td>
</tr>
  </tbody>
</table>

<script>
    $(function(){$("table").tablesorter();});
    anchors.add();
</script>
</body>
</html>
