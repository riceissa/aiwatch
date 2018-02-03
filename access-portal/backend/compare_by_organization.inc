<?php
$year = $_REQUEST['for'];
$seen = array();

$positions = array();
if ($stmt = $mysqli->prepare("select * from positions where year(start_date) = ? or year(end_date) = ?")) {
    $stmt->bind_param("ii", $year, $year);
    $stmt->execute();
    $result = $stmt->get_result();
}
while ($row = $result->fetch_assoc()) {
    if (!array_key_exists($row['organization'], $positions)) {
        $positions[$row['organization']] = array();
    }
    $positions[$row['organization']][] = $row;
}

$products = array();
if ($stmt = $mysqli->prepare("select product_creators.name as creator,products.* from product_creators left join products on products.name = product_creators.product where year(products.creation_date) = ? and product_creators.kind = 'organization'")) {
    $stmt->bind_param("i", $year);
    $stmt->execute();
    $result = $stmt->get_result();
}
while ($row = $result->fetch_assoc()) {
    if (!array_key_exists($row['creator'], $products)) {
        $products[$row['creator']] = array();
    }
    $products[$row['creator']][] = $row;
}

$organizations = array_unique(array_merge(array_keys($positions),
                                          array_keys($products)));
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

    <p><a href="/?organization=<?= urlencode($organization) ?>">Full page</a></p>

    <h3>Position changes</h3>

    <p>The following table shows positions that were affected
       during <?= htmlspecialchars($year) ?>.</p>
    <table>
    <thead>
        <tr>
            <th>Person</th>
            <th>Title</th>
            <th>Start date</th>
            <th>End date</th>
            <th>AI safety relation</th>
            <th>Subject</th>
            <th>Employment type</th>
            <th>Source</th>
            <th>Notes</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($positions[$organization] as $row) {
              list($start_guess, $start_explanation) = date_guess(
                $row['start_date_lower_guess'] ?? '',
                $row['start_date_upper_guess'] ?? '',
                "start");
              list($end_guess, $end_explanation) = date_guess(
                $row['end_date_lower_guess'] ?? '',
                $row['end_date_upper_guess'] ?? '',
                "end"); ?>
            <tr>
                <td><?= link_person($row['person']) ?></td>
                <td><?= $row['title'] ?? '' ?></td>
                <td><?= display_date($row['start_date'] ?? '',
                  $row['start_date_precision'] ?? '', $start_guess) ?></td>
                <td><?= display_date($row['end_date'] ?? '',
                  $row['end_date_precision'] ?? '', $end_guess) ?></td>
                <td title="<?= explain_ai_safety_relation($row['ai_safety_relation']) ?>"><?= $row['ai_safety_relation'] ?? '' ?></td>
                <td title="<?= explain_subject($row['subject']) ?>"><?= $row['subject'] ?? '' ?></td>
                <td><?= $row['employment_type'] ?? '' ?></td>
                <td><?= url_format($row['urls'], $seen) ?? '' ?></td>
                <td><?= implode(" ", array_filter(array($row['notes'] ?? '',
                  $start_explanation, $end_explanation))) ?></td>
            </tr>
        <?php } ?>
    </tbody>
    </table>

    <h3>Documents</h3>

    <h3>Products</h3>
    <p>The following table shows products created during
       <?= htmlspecialchars($year) ?>.</p>
    <table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Creation date</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
    <?php foreach ($products[$organization] as $row) { ?>
        <tr>
            <td><a href="<?= $row['url'] ?>"><?= $row['name'] ?></a></td>
            <td><?= $row['creation_date'] ?></td>
            <td><?= formatted_notes($row['description'], $seen) ?></td>
        </tr>
    <?php } ?>
    </tbody>
    </table>

<?php
} ?>
