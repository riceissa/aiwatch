<?php

if ($stmt = $mysqli->prepare("select * from agendas")) {
  $stmt->execute();
  $result = $stmt->get_result();
}

?>

<table>
  <thead>
    <tr>
      <th>Agenda name</th>
      <th>Associated people</th>
      <th>Associated organizations</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><?= link_agenda($row['name']) ?></td>
        <td><?= implode(', ', array_map('link_person', explode('|', $row['associated_people']))) ?></td>
        <td><?= implode(', ', array_map('link_organization', explode('|', $row['associated_organizations']))) ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
