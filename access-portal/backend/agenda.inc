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

<p>Key people: <?= implode(', ', array_map('link_person', explode('|', $row['associated_people']))) ?></p>

<h2>Overview</h2>

<?= $row['overview'] ?>

<h2>Goals of the agenda</h2>

<?= $row['goals'] ?>
