<?php
$organization = $_REQUEST['organization'];
?>

<h1>Information for <?= htmlspecialchars($organization) ?></h1>

<h2>Basic information</h2>

Coming soon.

<h2>List of researchers</h2>

<table>
  <thead>
    <tr>
      <th>Researcher</th>
      <th>Title</th>
      <th>Start date</th>
      <th>End date</th>
      <th>Source</th>
      <th>Notes</th>
    <tr>
  </thead>
  <tbody>
<?php
if ($stmt = $mysqli->prepare("select * from positions where organization = ?")) {
  $stmt->bind_param("s", $organization);
  $stmt->execute();
  $result = $stmt->get_result();
}

while ($row = $result->fetch_assoc()) { ?>
  <tr>
    <td><?= $row['researcher'] ?? '' ?></td>
    <td><?= $row['title'] ?? '' ?></td>
    <td><?= $row['start_date'] ?? '' ?></td>
    <td><?= $row['end_date'] ?? '' ?></td>
    <td><?= url_format($row['urls']) ?? '' ?></td>
    <td><?= $row['notes'] ?? '' ?></td>
  </tr>
<?php } ?>
  </tbody>
</table>
