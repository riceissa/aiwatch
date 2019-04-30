<h1>Intersect <?= $organization1 ?> and <?= $organization2 ?></h1>

<h2>Table of contents</h2>
<ul>
  <li><a href="#common-organizations">Common people</a></li>
  <li><a href="#organization-documents">Organization documents</a></li>
</ul>

<h2>Common people</h2>

<?php
  if ($stmt = $mysqli->prepare("select * from positions where organization = ?")) {
    $stmt->bind_param("s", $organization1);
    $stmt->execute();
    $result = $stmt->get_result();
  }
  $organization1_positions = array();
  $organization1_people = array();
  while ($row = $result->fetch_assoc()) {
    $organization1_positions[] = $row;
    $organization1_people[] = $row['person'];
  }

  if ($stmt = $mysqli->prepare("select * from positions where organization = ?")) {
    $stmt->bind_param("s", $organization2);
    $stmt->execute();
    $result = $stmt->get_result();
  }
  $organization2_positions = array();
  $organization2_people = array();
  while ($row = $result->fetch_assoc()) {
    $organization2_positions[] = $row;
    $organization2_people[] = $row['person'];
  }

  $intersect_people = array_intersect(array_unique($organization1_people),
                                      array_unique($organization2_people));
?>

<table>
  <thead>
    <th>Person</th>
    <th><?= link_organization($organization1) ?></th>
    <th><?= link_organization($organization2) ?></th>
  </thead>
  <tbody>
    <?php foreach ($intersect_people as $person) { ?>
      <tr>
        <td><?= link_person($person) ?></td>
        <td>
          <?php $first = true;
          foreach ($organization1_positions as $row) {
            if ($row['person'] == $person) {
              if (! $first) {
                echo "; ";
              }
              echo $row['title'] . " (" . $row["start_date"] . "–" . $row['end_date'] . ")";
              $first = false;
            }
          } ?>
        </td>
        <td>
          <?php $first = true;
          foreach ($organization2_positions as $row) {
            if ($row['person'] == $person) {
              if (! $first) {
                echo "; ";
              }
              echo $row['title'] . " (" . $row["start_date"] . "–" . $row['end_date'] . ")";
              $first = false;
            }
          } ?>
        </td>
      </tr>
    <?php } ?>
  </tbody>
</table>


<?php
  $query = "select * from organization_documents where (publisher = ? or affected_organizations regexp ?) and (publisher = ? or affected_organizations regexp ?) order by publication_date desc";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->bind_param("ssss", $organization1, $organization1, $organization2, $organization2);
    $stmt->execute();
    $result = $stmt->get_result();
  }
?>
<h2 id="organization-documents">Organization documents (<?= $result->num_rows ?> <?= $result->num_rows == 1 ? "document" : "documents" ?>)</h2>

<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Publication date</th>
      <th>Author</th>
      <th>Publisher</th>
      <th>Affected organizations</th>
      <th>Affected people</th>
      <th>Document scope</th>
      <th>Cause area</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><a href="<?= $row['url'] ?>"><?= $row['title'] ?></a></td>
        <td><?= $row['publication_date'] ?></td>
        <td><?= link_person($row['author']) ?></td>
        <td><?= $row['publisher'] ?></td>
        <td><?= implode(", ", array_map("link_organization", explode("|", $row['affected_organizations']))) ?></td>
        <td><?= implode(", ", array_map("link_person", explode("|", $row['affected_people']))) ?></td>
        <td><?= $row['document_scope'] ?></td>
        <td><?= $row['cause_area'] ?></td>
        <td><?= formatted_notes($row['notes'], $seen) ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
