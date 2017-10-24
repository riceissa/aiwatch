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
$researcher = $_REQUEST['researcher'];
if ($stmt = $mysqli->prepare("select * from positions where researcher = ?")) {
  $stmt->bind_param("s", $researcher);
  $stmt->execute();
  $result = $stmt->get_result();
}

while ($row = $result->fetch_assoc()) { ?>
  <tr>
    <td><?= $row['organization'] ?? '' ?></td>
    <td><?= $row['title'] ?? '' ?></td>
    <td><?= $row['start_date'] ?? '' ?></td>
    <td><?= $row['end_date'] ?? '' ?></td>
    <td><?= url_format($row['urls']) ?? '' ?></td>
    <td><?= $row['notes'] ?? '' ?></td>
  </tr>
<?php } ?>

  </tbody>
</table>
