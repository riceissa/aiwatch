<h2 id="individuals-not-affiliated-with-any-organization">Individuals
  not affiliated with any organization</h2>
<?php
  $query = "select person,website,urls from people where person not in (select distinct(person) from positions)";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->execute();
    $result = $stmt->get_result();
  }
  $seen = array();
?>
<p>Showing <?= $mysqli->affected_rows ?> people.</p>
<table>
  <thead>
    <tr>
      <th>Organization</th>
      <th>Website</th>
      <th>Source</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><?= link_person($row['person']) ?></td>
        <td><?= ($val = $row['website']) ? '<a href="' . $val . '">' . $val . '</a>' : ''?></td>
        <td><?= url_format($row['urls'], $seen) ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
