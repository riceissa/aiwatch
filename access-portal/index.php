<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <title>AI Watch</title>
  <link rel="stylesheet" href="/tablesorter.css">
  <script src="/jquery.min.js"></script>
  <script src="/jquery.tablesorter.js"></script>
<?php include_once("style.inc"); ?>
<?php include_once("analytics.inc"); ?>
</head>
<body>
<nav>
<a href="/index.php">Home</a>
</nav>
<?php
include_once("backend/globalVariables/passwordFile.inc");
include_once("backend/util.inc");
if ($_REQUEST['person'] ?? '') {
  include("backend/person.inc");
} else if ($_REQUEST['organization'] ?? '') {
  include("backend/organization.inc");
} else { // Main index.php with no parameters
  if ($stmt = $mysqli->prepare("select person,group_concat(distinct organization SEPARATOR '|') as orgs,count(distinct organization) as numOrgs from positions group by person order by count(distinct organization) desc")) {
    $stmt->execute();
    $result = $stmt->get_result();
  }
?>

<p>Welcome! See the <a href="https://github.com/riceissa/aiwatch">code repository</a> for the source code and data of this website.</p>

<p>Showing <?= $mysqli->affected_rows ?> people.</p>

<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Number of organizations</th>
      <th>List of organizations</th>
    </tr>
  </thead>
<?php
  while ($row = $result->fetch_assoc()) { ?>
    <tr>
      <td><a href="/index.php?person=<?= urlencode($row['person']) ?>"><?= $row['person'] ?></a></td>
      <td><?= $row['numOrgs'] ?></td>
      <td><?php
            $orglist = explode('|', $row['orgs']);
            $res = array();
            foreach($orglist as $org) {
              array_push(
                $res,
                '<a href="/index.php?organization=' . urlencode($org) . '">' . $org . '</a>'
              );
            }
            echo implode(", ", $res); ?></td>
    </tr>
<?php } ?>

<?php } ?>

<script>
    $(function(){$("table").tablesorter();});
</script>
</body>
</html>

