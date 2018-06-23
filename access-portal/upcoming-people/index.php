<?php
include_once("../backend/globalVariables/passwordFile.inc");
if ($subdomain != "aiwatch") {
  http_response_code(404);
  die();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <meta name="dcterms.date" content="2018-06-13">
  <meta property="og:title" content="Upcoming AI safety people" />
  <meta property="og:site_name" content="AI Watch" />
  <meta property="og:locale" content="en_US" />
  <title>Upcoming AI safety people - AI Watch</title>
  <link rel="stylesheet" href="/tablesorter.css">
  <script src="/jquery.min.js"></script>
  <script src="/jquery.tablesorter.js"></script>
  <script src="/anchor.min.js"></script>
<?php include_once("../style.inc"); ?>
<?php include_once("../analytics.inc"); ?>
</head>
<body>
<?php include_once("../navbar.inc"); ?>

<h1>Upcoming AI safety people</h1>

<p>This page tracks people who are currently training to work on AI
  safety, but have not held positions at organizations or published
  work. The idea is to stay “one step ahead” by knowing which people
  will likely enter the field. Since the data here is not intended to
  be permanent, it is simply stored on this web page rather than being
  entered into the database.</p>

<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Type of position</th>
      <th>Source</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>David Kristoffersson</td>
      <td>Technical research?</td>
      <td><a href="https://www.greaterwrong.com/posts/FvA2qL6ChCbyi5Axk/book-review-naive-set-theory-miri-research-guide">Source</a></td>
      <td>He might already hold a position, seeing that his post is from 2015.</td>
    </tr>
    <tr>
      <td>elriggs</td>
      <td>Technical research?</td>
      <td><a href="https://www.greaterwrong.com/posts/iHuMFnHHhtehTBYEY/saving-the-world-in-80-days-prologue">Source</a></td>
      <td></td>
    </tr>
    <tr>
      <td>Andrew Quinn</td>
      <td>Technical research?</td>
      <td><a href="https://www.greaterwrong.com/posts/8vBSgToXryKGncMyk/math-towards-proof-writing-as-a-skill-in-itself">Source</a></td>
      <td></td>
    </tr>
    <tr>
      <td><a href="https://www.greaterwrong.com/posts/eAsN5vNjvmxzACuuX/swimming-upstream-a-case-study-in-instrumental-rationality">Alexander Matt Turner</a> (TurnTrout)</td>
      <td>Technical research</td>
      <td><a href="https://www.greaterwrong.com/posts/EvKWNRkJgLosgRDSa/lightness-and-unease">Source</a></td>
      <td><a href="https://github.com/alexander-turner">GitHub account</a>
      </td>
    </tr>
    <tr>
      <td>Sudhanshu Kasewa</td>
      <td></td>
      <td>Private correspondence</td>
      <td></td>
    </tr>
    <tr>
      <td>Christopher Galias</td>
      <td>Technical research?</td>
      <td><a href="https://aisafetycamp.com/2018/06/05/aisc-1-research-summaries/">Source</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>Nandi Schoots</td>
      <td>Technical research?</td>
      <td><a href="https://aisafetycamp.com/2018/06/05/aisc-1-research-summaries/">Source</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>Karl Koch</td>
      <td>Technical research?</td>
      <td><a href="https://aisafetycamp.com/2018/06/05/aisc-1-research-summaries/">Source</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>Markus Salmela</td>
      <td>Technical research?</td>
      <td><a href="https://aisafetycamp.com/2018/06/05/aisc-1-research-summaries/">Source</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>Justin Shovelain</td>
      <td>Technical research?</td>
      <td><a href="https://aisafetycamp.com/2018/06/05/aisc-1-research-summaries/">Source</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>Vojta Kovarik</td>
      <td>Technical research?</td>
      <td><a href="https://aisafetycamp.com/2018/06/05/aisc-1-research-summaries/">Source</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>Igor Sieradzki</td>
      <td>Technical research?</td>
      <td><a href="https://aisafetycamp.com/2018/06/05/aisc-1-research-summaries/">Source</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>Michael Świętek</td>
      <td>Technical research?</td>
      <td><a href="https://aisafetycamp.com/2018/06/05/aisc-1-research-summaries/">Source</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>James Bell</td>
      <td>Technical research?</td>
      <td><a href="https://aisafetycamp.com/2018/06/05/aisc-1-research-summaries/">Source</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>Linda Linsefors</td>
      <td>Technical research?</td>
      <td><a href="https://aisafetycamp.com/2018/06/05/aisc-1-research-summaries/">Source</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>Joar Skalse</td>
      <td>Technical research?</td>
      <td><a href="https://aisafetycamp.com/2018/06/05/aisc-1-research-summaries/">Source</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>Karol Kubicki</td>
      <td>Technical research?</td>
      <td><a href="https://aisafetycamp.com/2018/06/05/aisc-1-research-summaries/">Source</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>Gavin Leech</td>
      <td>Technical research?</td>
      <td><a href="https://aisafetycamp.com/2018/06/05/aisc-1-research-summaries/">Source</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>Xavier O’Rourke</td>
      <td></td>
      <td><a href="https://www.facebook.com/xavier.orourke92/posts/10156282761874312">Source</a></td>
      <td>Attended AISFP.</td>
    </tr>
    <tr>
      <td>Jarryd Martin</td>
      <td></td>
      <td><a href="https://www.facebook.com/xavier.orourke92/posts/10156282761874312?comment_id=10156283923089312&reply_comment_id=10156284497579312&comment_tracking=%7B%22tn%22%3A%22R4%22%7D">Source</a></td>
      <td>Apparently attended AISFP.</td>
    </tr>
    <tr>
      <td>Eric Bruylant</td>
      <td></td>
      <td><a href="http://www.rationality.org/studies/2016-case-studies#arbital">Source</a></td>
      <td>Attended 2015 MIRI Summer Fellows program.</td>
    </tr>
    <tr>
      <td>Pasha Kamyshev</td>
      <td></td>
      <td><a href="https://agentfoundations.org/item?id=543">Source</a></td>
      <td>Apparently attended MIRI Summer Fellows program.</td>
    </tr>
    <tr>
      <td>Johnathan Lee</td>
      <td></td>
      <td><a href="https://agentfoundations.org/item?id=543">Source</a></td>
      <td>Apparently attended MIRI Summer Fellows program.</td>
    </tr>
    <tr>
      <td>Zachary Vance</td>
      <td></td>
      <td><a href="https://agentfoundations.org/item?id=543">Source</a></td>
      <td>Apparently attended MIRI Summer Fellows program.</td>
    </tr>
    <tr>
      <td>Vladimir Mikulik</td>
      <td>Technical research?</td>
      <td><a href="https://www.facebook.com/groups/1919382931631508/">Source</a></td>
      <td>Admin of a “technical AI safety discussion group” in Oxford.</td>
    </tr>
    <tr>
      <td>Joar Skalse</td>
      <td>Technical research?</td>
      <td><a href="https://www.facebook.com/groups/1919382931631508/">Source</a></td>
      <td>Admin of a “technical AI safety discussion group” in Oxford.</td>
    </tr>
  </tbody>
</table>

<p>Other data points of interest:</p>

<ul>
  <li>Open Philanthropy Project’s 2018 AI Fellows program had <a href="https://www.openphilanthropy.org/focus/global-catastrophic-risks/potential-risks-advanced-artificial-intelligence/announcing-2018-ai-fellows">over 180 applicants</a>.</li>
  <li>There is an <a href="https://www.facebook.com/groups/126078381382350/">AISFP 2017</a> Facebook group (a closed group; <a href="http://archive.today/2018.06.14-215353/https://www.facebook.com/groups/126078381382350/members/">partial members list</a>).</li>
  <li>There is a <a href="https://www.facebook.com/groups/680751902062471/">MIRI Summer Fellows</a> Facebook group (a closed group; <a href="http://archive.today/2018.06.14-215458/https://www.facebook.com/groups/680751902062471/members/">partial members list</a>).</li>
</ul>


<script>
    $(function(){$("table").tablesorter();});
    anchors.add();
</script>
</body>
</html>
