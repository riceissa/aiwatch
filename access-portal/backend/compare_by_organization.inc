<?php
$year = $_REQUEST['for'];
$seen = array();
$organizations = array();
if ($stmt = $mysqli->prepare("select * from organizations")) {
    $stmt->execute();
    $result = $stmt->get_result();
}

while ($row = $result->fetch_assoc()) {
    $organizations[] = $row['organization'];
}
?>

<h1>Comparison of organizations for <?= htmlspecialchars($year) ?></h1>

<h2>Table of contents</h2>
<ul>
    <?php foreach ($organizations as $organization) { ?>
        <li><a href="#<?= anchorText($organization) ?>"><?= $organization ?></a></li>
    <?php } ?>
</ul>

<?php
foreach ($organizations as $organization) { ?>

    <h2><?= $organization ?></h2>

    <h3>Position changes</h3>

    <h3>Documents</h3>

    <h3>Products</h3>

<?php
} ?>
