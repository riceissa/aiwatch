<h2 id="products">Products</h2>
<?php
  if ($stmt = $mysqli->prepare("select * from product_creators")) {
    $stmt->execute();
    $result = $stmt->get_result();
  }
  $creators = array();
  while ($row = $result->fetch_assoc()) {
    if ($row['kind'] == "person") {
      $linked = link_person($row['name']);
    } else {
      $linked = link_organization($row['name']);
    }

    if (array_key_exists($row['product'], $creators)) {
      $creators[$row['product']][] = $linked;
    } else {
      $creators[$row['product']] = array($linked);
    }
  }

  $query = "select * from products";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->execute();
    $result = $stmt->get_result();
  }
?>

<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Creator</th>
      <th>Creation date</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><a href="<?= $row['url'] ?>"><?= $row['name'] ?></a></td>
        <td><?= implode(", ", $creators[$row['name']]) ?></td>
        <td><?= $row['creation_date'] ?></td>
        <td><?= formatted_notes($row['description'], $seen) ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
