<?php
$agenda = $_REQUEST['agenda'];
?>

<h1>Information for <?= htmlspecialchars($agenda) ?></h1>

<?php
if ($stmt = $mysqli->prepare("select * from agendas where name = ?")) {
  $stmt->bind_param("s", $agenda);
  $stmt->execute();
  $result = $stmt->get_result();
}
$row = $result->fetch_assoc();
?>

<h2>Basic information</h2>

<p>Associated people: <?= implode(', ', array_map('link_person', explode('|', $row['associated_people']))) ?></p>
<p>Associated organizations: <?= implode(', ', array_map('link_organization', explode('|', $row['associated_organizations']))) ?></p>

<h2>Overview</h2>

<?= $row['overview'] ?>

<h2>Goals of the agenda</h2>

<?= $row['goals'] ?>

<h2>Assumptions the agenda makes</h2>

<h3>AI timelines</h3>

<?= $row['ai_timelines_assumptions'] ?>

<h3>Nature of intelligence</h3>

<?= $row['nature_of_intelligence_assumptions'] ?>

<h3>Other</h3>

<?= $row['other_assumptions'] ?>

<h2>Documents</h2>

<?php
if ($stmt = $mysqli->prepare("select * from documents where affected_agendas regexp ?")) {
  $stmt->bind_param("s", $agenda);
  $stmt->execute();
  $result = $stmt->get_result();
}
?>

<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Publication date</th>
      <th>Author</th>
      <th>Publisher</th>
      <th>Affected organizations</th>
      <th>Affected people</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><?= $row['title'] ?></td>
        <td><?= $row['publication_date'] ?></td>
        <td><?= implode(", ", array_map("link_person", explode("|", $row['author']))) ?></td>
        <td><?= $row['publisher'] ?></td>
        <td><?= implode(", ", array_map("link_organization", explode("|", $row['affected_organizations']))) ?></td>
        <td><?= implode(", ", array_map("link_person", explode("|", $row['affected_people']))) ?></td>
        <td><?= formatted_notes($row['notes'], $seen) ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
