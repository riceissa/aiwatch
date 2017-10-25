<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <title>AI Watch</title>
</head>
<body>
<nav>
<a href="/index.php">Home</a>
</nav>
<?php
include_once("backend/globalVariables/passwordFile.inc");
include_once("backend/util.inc");
if ($_REQUEST['researcher']) {
  include("backend/researcher.inc");
} else if ($REQUEST['organization']) {
  include("backend/organization.inc");
} else { // Main index.php with no parameters
?>

<p>Welcome! See the <a href="https://github.com/riceissa/aiwatch">code repository</a> for the source code and data of this website.</p>

<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Number of organizations</th>
    </tr>
  </thead>
<?php
  if ($stmt = $mysqli->prepare("select researcher,count(distinct organization) as numOrgs from positions group by researcher order by count(distinct organization) desc")) {
    $stmt->execute();
    $result = $stmt->get_result();
  }
  while ($row = $result->fetch_assoc()) { ?>
    <tr>
      <td><a href="/?researcher=<?= urlencode($row['researcher']) ?>"><?= $row['researcher'] ?></a></td>
      <td><?= $row['numOrgs'] ?></td>
    </tr>
<?php } ?>

<?php } ?>
</body>
</html>

