<?php
$researcher = $_REQUEST['researcher'];
$seen = array();
?>

<h1>Information for <?= htmlspecialchars($researcher) ?></h1>

<h2>Basic information</h2>

<table>
  <thead>
    <tr>
      <th>Item</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>

<?php
if ($stmt = $mysqli->prepare("select * from researchers where researcher = ?")) {
  $stmt->bind_param("s", $researcher);
  $stmt->execute();
  $result = $stmt->get_result();
}
while ($row = $result->fetch_assoc()) { ?>
  <tr>
    <td>Country</td>
    <td><?= $row['country'] ?? '' ?></td>
  </tr>
  <tr>
    <td>Facebook username</td>
    <td><?= $row['facebook_username'] ?? '' ?></td>
  </tr>
  <tr>
    <td>GitHub username</td>
    <td><?= $row['github_username'] ?? '' ?></td>
  </tr>
  <tr>
    <td>LinkedIn username</td>
    <td><?= $row['linkedin_username'] ?? '' ?></td>
  </tr>
  <tr>
    <td>Website</td>
    <td><?= $row['website'] ? '<a href="' . $row['website'] . '">' . $row['website'] . '</a>' : '' ?></td>
  </tr>

<?php } ?>

  </tbody>
</table>

<h2>List of positions</h2>

<table>
  <thead>
    <tr>
      <th>Organization</th>
      <th>Title</th>
      <th>Start date</th>
      <th>End date</th>
      <th>Source</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>

<?php
if ($stmt = $mysqli->prepare("select * from positions where researcher = ?")) {
  $stmt->bind_param("s", $researcher);
  $stmt->execute();
  $result = $stmt->get_result();
}

while ($row = $result->fetch_assoc()) { ?>
  <tr>
    <td><a href="/index.php?organization=<?= urlencode($row['organization']) ?? '' ?>"><?= $row['organization'] ?? '' ?></a></td>
    <td><?= $row['title'] ?? '' ?></td>
    <td><?= $row['start_date'] ?? '' ?></td>
    <td><?= $row['end_date'] ?? '' ?></td>
    <td><?= url_format($row['urls'], $seen) ?? '' ?></td>
    <td><?= $row['notes'] ?? '' ?></td>
  </tr>
<?php } ?>

  </tbody>
</table>
