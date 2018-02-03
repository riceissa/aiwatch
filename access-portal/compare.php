<!DOCTYPE html>
<html lang="en">
<?php
$head_date = trim(file_get_contents("head_date.txt"));
$title = "";
if (($_REQUEST['by'] ?? '') && ($_REQUEST['for'] ?? '')) {
    $title = "Comparison by " . htmlspecialchars($_REQUEST['by'])
        . " for " . htmlspecialchars($_REQUEST['for']);
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
<nav>
  <a href="/">Home</a>,
  <a href="/about/">About</a>
</nav>
<?php
include_once("backend/globalVariables/passwordFile.inc");
include_once("backend/util.inc");
if (($_REQUEST['by'] ?? '') == 'organization') {
  include("backend/compare_by_organization.inc");
} else if (($_REQUEST['by'] ?? '') == 'year') {
  // add later
} else { ?>
    <p>Sorry, this comparison grouping is not possible.</p>
<?php } ?>

<script>
    $(function(){$("table").tablesorter();});
    anchors.add();
</script>
</body>
</html>
