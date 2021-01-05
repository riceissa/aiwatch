<?php
include_once("backend/globalVariables/passwordFile.inc");
// Replace any spaces in the URL with plus sign, and redirect to the new
// location if the replacement caused any changes in the URL.
$request_uri = preg_replace('/(%20| )/', '+', $_SERVER['REQUEST_URI']);
if ($request_uri !== $_SERVER['REQUEST_URI']) {
    header("Location: " . $request_uri);
    die();
}
?>
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
<?php include_once("navbar.inc"); ?>
<?php
include_once("backend/util.inc");
if (($_REQUEST['by'] ?? '') == 'organization') {
    include("backend/compare_by_organization.inc");
} else if (($_REQUEST['by'] ?? '') == 'year') {
    // add later
} else {
    if ($stmt = $mysqli->prepare("select distinct(year(start_date)) as year from positions where start_date is not null union select distinct(year(end_date)) as year from positions where end_date is not null union select year(creation_date) as year from products where creation_date is not null order by year")) {
        $stmt->execute();
        $result = $stmt->get_result();
    }
?>
    <h2>Compare organizations</h2>
    <ul>
        <?php while ($row = $result->fetch_assoc()) { ?>
            <li><a href="/compare.php?by=organization&amp;for=<?= $row['year'] ?>"><?= $row['year'] ?></a></li>
        <?php } ?>
    </ul>

    <h2>Compare years</h2>
    <p>Coming soon.</p>
<?php } ?>

<script>
    $(function(){$("table").tablesorter();});
    anchors.add();
</script>
</body>
</html>
