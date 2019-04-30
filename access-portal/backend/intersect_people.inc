<h1>Intersect <?= $person1 ?> and <?= $person2 ?></h1>

<h2>Table of contents</h2>
<ul>
  <li><a href="#common-organizations">Common organizations</a></li>
  <li><a href="#organization-documents">Organization documents</a></li>
</ul>

<h2>Common organizations</h2>

<?php
  if ($stmt = $mysqli->prepare("select * from positions where person = ?")) {
    $stmt->bind_param("s", $person1);
    $stmt->execute();
    $result = $stmt->get_result();
  }
  $person1_positions = array();
  $person1_orgs = array();
  while ($row = $result->fetch_assoc()) {
    $person1_positions[] = $row;
    $person1_orgs[] = $row['organization'];
  }

  if ($stmt = $mysqli->prepare("select * from positions where person = ?")) {
    $stmt->bind_param("s", $person2);
    $stmt->execute();
    $result = $stmt->get_result();
  }
  $person2_positions = array();
  $person2_orgs = array();
  while ($row = $result->fetch_assoc()) {
    $person2_positions[] = $row;
    $person2_orgs[] = $row['organization'];
  }

  $intersect_orgs = array_intersect(array_unique($person1_orgs), array_unique($person2_orgs));
?>

<table>
  <thead>
    <th>Organization</th>
    <th><?= link_person($person1) ?></th>
    <th><?= link_person($person2) ?></th>
  </thead>
  <tbody>
    <?php foreach ($intersect_orgs as $org) { ?>
      <tr>
        <td><?= link_organization($org) ?></td>
        <td>
          <?php $first = true;
          foreach ($person1_positions as $row) {
            if ($row['organization'] == $org) {
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
          foreach ($person2_positions as $row) {
            if ($row['organization'] == $org) {
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
  $query = "select * from organization_documents where (author = ? or affected_people regexp ?) and (author = ? or affected_people regexp ?) order by publication_date desc";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->bind_param("ssss", $person1, $person1, $person2, $person2);
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
