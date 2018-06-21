<h2 id="products">Products</h2>

<p>This section lists <?= $subdomain === "aiwatch" ? "AI safety-related" : "" ?>
  “products”: interactive tools,
  websites, flowcharts, datasets, etc. Unlike documents, products
  tend to be interactive, are updated continually, or require inputs
  from the consumer.</p>

<?php
$creators = linkedCreators($mysqli, "select * from product_creators", "");

$query = "select * from products order by creation_date desc";
if ($stmt = $mysqli->prepare($query)) {
    $stmt->execute();
    $result = $stmt->get_result();
}
?>

<p>Showing <?= $mysqli->affected_rows ?> products.</p>
<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Type</th>
      <th>Creator</th>
      <th>Creation date</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><a href="<?= $row['url'] ?>"><?= $row['name'] ?></a></td>
        <td><?= $row['product_type'] ?></td>
        <td><?= implode(", ", $creators[$row['name']]) ?></td>
        <td><?= display_date($row['creation_date'],
                             $row['creation_date_precision'], "") ?></td>
        <td><?= formatted_notes($row['description'], $seen) ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
