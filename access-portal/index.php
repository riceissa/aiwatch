<!DOCTYPE html>
<html lang="en">
<?php
include_once("backend/globalVariables/passwordFile.inc");
$head_date = trim(file_get_contents("head_date.txt"));
$title = "";
if ($_REQUEST['person'] ?? '') {
  $title = htmlspecialchars($_REQUEST['person']);
} else if ($_REQUEST['organization'] ?? '') {
  $title = htmlspecialchars($_REQUEST['organization']);
}

$site_name = $subdomain === "aiwatch" ? "AI Watch" : "Org Watch";
?>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <meta name="dcterms.date" content="<?= $head_date ?>">
  <meta property="og:title" content="<?= $title ? $title : $site_name ?>" />
  <meta property="og:site_name" content="<?= $site_name ?>" />
  <meta property="og:locale" content="en_US" />
  <title><?= $title ? $title . " - " . $site_name : $site_name ?></title>
  <link rel="stylesheet" href="/tablesorter.css">
  <script src="/jquery.min.js"></script>
  <script src="/jquery.tablesorter.js"></script>
  <script src="/anchor.min.js"></script>
<?php include_once("style.inc"); ?>
<?php include_once("analytics.inc"); ?>
</head>
<body>
<?php include_once("navbar.inc"); ?>
<?php
include_once("backend/util.inc");
if ($_REQUEST['person'] ?? '') {
  include("backend/person.inc");
} else if ($_REQUEST['organization'] ?? '') {
  include("backend/organization.inc");
} else if ($_REQUEST['agenda'] ?? '') {
  include("backend/agenda.inc");
} else {
  $isFiltered = ($_REQUEST['subject'] ?? '') || ($_REQUEST['relation'] ?? '');
?>
<h1><?= $site_name ?></h1>

<p>
<?php if ($subdomain === "aiwatch") { ?>
  Welcome! This is a website to track people and organizations working on AI safety.
<?php } else { ?>
  Welcome! This is a website to track people and organizations.
<?php } ?>
  See the <a href="https://github.com/riceissa/aiwatch">code repository</a>
  for the source code and data of this website.
</p>

<?php if ($subdomain === "aiwatch") { ?>
  <p>This website is developed by <a href="https://issarice.com">Issa Rice</a>
  and has been partially
  <a href="https://contractwork.vipulnaik.com/tasks.php?receptacle=AI+Watch&amp;matching=exact">funded by Vipul Naik</a>.</p>
<?php } else { ?>
  <p>This website is developed by <a href="https://issarice.com">Issa Rice</a>
  and has been partially
  <a href="https://contractwork.vipulnaik.com/tasks.php?receptacle=Org+Watch&amp;matching=exact">funded by Vipul Naik</a>.</p>
<?php } ?>

<p><strong>If you like (or want to like) this website and have money:</strong> the current
funder doesn't want to continue funding this project. As a result, it is
currently mostly sitting around. If you want to bring this site to the next
level, contact Issa at riceissa@gmail.com. What you get: site improvements,
recognition in the site credits. What the site needs: money.</p>

<p><strong>If you have time and want experience building websites:</strong> this website is
looking for contributors. If you want to help out, contact Issa at
riceissa@gmail.com. What you get: little or no pay (this could change if the
site gets funding; see previous paragraph), recognition in the site credits,
privilege of working with me, knowledge of the basics of web development
(MySQL, PHP, Git). What the site needs: data collection/entry and website code
improvements.</p>

<p>Last updated on <?= $head_date ?>.</p>

<h2 id="table-of-contents">Table of contents</h2>

<ul>
  <?php if (!$isFiltered) { ?>
    <?php if ($subdomain === "aiwatch") { ?>
      <li><a href="#ai-safety-relation-by-subject">AI safety relation by subject</a></li>
    <?php } ?>
    <li><a href="#positions-summary-by-year">Positions summary by year</a></li>
  <?php } ?>
  <li><a href="#positions-grouped-by-person">Positions grouped by person</a></li>
  <li><a href="#positions-grouped-by-organization">Positions grouped by organization</a></li>
  <?php if (!$isFiltered) { ?>
    <li><a href="#individuals-not-affiliated-with-any-organization">Individuals
      not affiliated with any organization</a></li>
    <li><a href="#products">Products</a></li>
  <?php } ?>
</ul>

<?php
if ($subdomain === "aiwatch") {
  include("backend/agendas_table.inc");
}
?>

<?php if (!$isFiltered) {
  if ($subdomain === "aiwatch") {
    include("backend/relation_by_subject.inc");
  }
  include("backend/positions_summary_by_year.inc");
} ?>

<?php include("backend/positions_by_person.inc"); ?>

<?php include("backend/positions_by_organization.inc"); ?>

<?php if (!$isFiltered) {
  include("backend/unaffiliated_individuals.inc");
  include("backend/products.inc");
} ?>

<?php } ?>

<script>
    $(function(){$("table").tablesorter();});
    anchors.add();
</script>
</body>
</html>
