<!DOCTYPE html>
<html lang="en">
<?php
include_once("backend/globalVariables/passwordFile.inc");

// Replace any spaces in the URL with plus sign, and redirect to the new
// location if the replacement caused any changes in the URL.
$request_uri = preg_replace('/(%20| )/', '+', $_SERVER['REQUEST_URI']);
if ($request_uri !== $_SERVER['REQUEST_URI']) {
    header("Location: " . $request_uri);
    die();
}

$head_date = trim(file_get_contents("head_date.txt"));
$title = "";

if (($_REQUEST['person1'] ?? '') and ($_REQUEST['person1'] ?? '')) {
  $person1 = $_REQUEST['person1'];
  $person2 = $_REQUEST['person2'];
} else {
  $person1 = "";
  $person2 = "";
}

if (($_REQUEST['organization1'] ?? '') and ($_REQUEST['organization2'] ?? '')) {
  $organization1 = $_REQUEST['organization1'];
  $organization2 = $_REQUEST['organization2'];
} else {
  $organization1 = "";
  $organization2 = "";
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
  <script src="change-theme.js"></script>
<?php include_once("style.inc"); ?>
<?php include_once("analytics.inc"); ?>
</head>
<body>
<?php include_once("navbar.inc"); ?>
<?php
include_once("backend/util.inc");

if ($person1 && $person2) {
  include_once("backend/intersect_people.inc");
} else if ($organization1 && $organization2) {
  include_once("backend/intersect_organizations.inc");
}
?>

<script>
    $(function(){$("table").tablesorter();});
    anchors.add();
    document.getElementById('changeThemeMenu').style.display='inline';
    set_theme_from_cookies();
</script>
</body>
</html>
