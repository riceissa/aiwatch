<!DOCTYPE html>
<html lang="en">
<?php
$head_date = trim(file_get_contents("head_date.txt"));
$title = "";
if ($_REQUEST['person'] ?? '') {
  $title = htmlspecialchars($_REQUEST['person']);
} else if ($_REQUEST['organization'] ?? '') {
  $title = htmlspecialchars($_REQUEST['organization']);
}
?>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <meta name="dcterms.date" content="<?= $head_date ?>">
  <meta property="og:title" content="<?= $title ? $title : "AI Watch" ?>" />
  <meta property="og:site_name" content="AI Watch" />
  <meta property="og:locale" content="en_US" />
  <title><?= $title ? $title . " - AI Watch" : "AI Watch" ?></title>
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
include_once("backend/globalVariables/passwordFile.inc");
include_once("backend/util.inc");
if ($_REQUEST['person'] ?? '') {
  include("backend/person.inc");
} else if ($_REQUEST['organization'] ?? '') {
  include("backend/organization.inc");
} else {
  $isFiltered = ($_REQUEST['subject'] ?? '') || ($_REQUEST['relation'] ?? '');
?>
<h1>AI Watch</h1>

<p>Welcome! This is a website to track people and organizations working on AI safety. See the <a href="https://github.com/riceissa/aiwatch">code repository</a> for the source code and data of this website.</p>

<p>This website is developed by <a href="https://issarice.com">Issa Rice</a>
  and is partially
  <a href="https://contractwork.vipulnaik.com/tasks.php?receptacle=AI+Watch&amp;matching=exact">funded by Vipul Naik</a>.</p>

<p>This site is still under active development.</p>

<p>Last updated on <?= $head_date ?>.</p>

<h2 id="table-of-contents">Table of contents</h2>

<ul>
  <?php if (!$isFiltered) { ?>
    <li><a href="#ai-safety-relation-by-subject">AI safety relation by subject</a></li>
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

<?php if (!$isFiltered) {
  include("backend/relation_by_subject.inc");
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
