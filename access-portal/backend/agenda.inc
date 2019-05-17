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
