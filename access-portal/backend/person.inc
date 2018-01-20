<?php
$person = $_REQUEST['person'];
$seen = array();
?>

<h1>Information for <?= htmlspecialchars($person) ?></h1>

<h2>Basic information</h2>

<table>
  <thead>
    <tr>
      <th>Item</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>

<?php
if ($stmt = $mysqli->prepare("select * from people where person = ?")) {
  $stmt->bind_param("s", $person);
  $stmt->execute();
  $result = $stmt->get_result();
}
while ($row = $result->fetch_assoc()) { ?>
  <?php if ($country = ($row['country'] ?? '')) { ?>
    <tr>
      <td>Country</td>
      <td><?= $country ?></td>
    </tr>
  <?php } ?>
  <?php if ($fb = ($row['facebook_username'] ?? '')) { ?>
    <tr>
      <td>Facebook username</td>
      <td><a href="https://www.facebook.com/<?= $fb ?>"><?= $fb ?></a></td>
    </tr>
  <?php } ?>
  <?php if ($gh = ($row['github_username'] ?? '')) { ?>
    <tr>
      <td>GitHub username</td>
      <td><a href="https://github.com/<?= $gh ?>"><?= $gh ?></a></td>
    </tr>
  <?php } ?>
  <?php if ($li = ($row['linkedin_username'] ?? '')) { ?>
    <tr>
      <td>LinkedIn username</td>
      <td><a href="https://www.linkedin.com/in/<?= $li ?>"><?= $li ?></a></td>
    </tr>
  <?php } ?>
  <?php if ($lw = ($row['lesswrong_username'] ?? '')) { ?>
    <tr>
      <td>LessWrong username</td>
      <td><a href="http://lesswrong.com/user/<?= $lw ?>"><?= $lw ?></a></td>
    </tr>
  <?php } ?>
  <?php if ($af = ($row['agentfoundations_username'] ?? '')) { ?>
    <tr>
      <td>Intelligent Agent Foundations Forum username</td>
      <td><a href="https://agentfoundations.org/user?id=<?= $af ?>"><?= $af ?></a></td>
    </tr>
  <?php } ?>
  <?php if ($web = ($row['website'] ?? '')) { ?>
    <tr>
      <td>Website</td>
      <td><a href="<?= $web ?>"><?= $web ?></a></td>
    </tr>
  <?php } ?>
  <?php if ($urls = ($row['urls'] ?? '')) { ?>
    <tr>
      <td>Source</td>
      <td><?= url_format($urls, $seen) ?></td>
    </tr>
  <?php } ?>
  <?php if ($val = ($row['notes'] ?? '')) { ?>
    <tr>
      <td>Notes</td>
      <td><?= $val ?></td>
    </tr>
  <?php } ?>

<?php } ?>

  </tbody>
</table>

<h2>List of positions</h2>

<table>
  <thead>
    <tr>
      <th>Organization</th>
      <th>Title</th>
      <th>Start date</th>
      <th>End date</th>
      <th>Source</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>

<?php
if ($stmt = $mysqli->prepare("select * from positions where person = ?")) {
  $stmt->bind_param("s", $person);
  $stmt->execute();
  $result = $stmt->get_result();
}

while ($row = $result->fetch_assoc()) {
  list($start_guess, $start_explanation) = date_guess(
    $row['start_date_lower_guess'] ?? '',
    $row['start_date_upper_guess'] ?? '',
    "start");
  list($end_guess, $end_explanation) = date_guess(
    $row['end_date_lower_guess'] ?? '',
    $row['end_date_upper_guess'] ?? '',
    "end");
?>
  <tr>
    <td><?= link_organization($row['organization']) ?></td>
    <td><?= $row['title'] ?? '' ?></td>
    <td><?= display_date($row['start_date'] ?? '',
      $row['start_date_precision'] ?? '', $start_guess) ?></td>
    <td><?= display_date($row['end_date'] ?? '',
      $row['end_date_precision'] ?? '', $end_guess) ?></td>
    <td><?= url_format($row['urls'], $seen) ?? '' ?></td>
    <td><?= implode(" ", array_filter(array($row['notes'] ?? '',
      $start_explanation, $end_explanation))) ?></td>
  </tr>
<?php } ?>

  </tbody>
</table>

<h2 id="products">Products</h2>
<?php
  $query = "select * from products where products.name in (select product from product_creators where name = ?);";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->bind_param("s", $person);
    $stmt->execute();
    $result = $stmt->get_result();
  }
?>

<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Creation date</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><a href="<?= $row['url'] ?>"><?= $row['name'] ?></a></td>
        <td><?= $row['creation_date'] ?></td>
        <td><?= formatted_notes($row['description'], $seen) ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
