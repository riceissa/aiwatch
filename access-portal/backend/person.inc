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

while ($row = $result->fetch_assoc()) { ?>
  <tr>
    <td><?= link_organization($row['organization']) ?></td>
    <td><?= $row['title'] ?? '' ?></td>
    <td><?= $row['start_date'] ?? '' ?></td>
    <td><?= $row['end_date'] ?? '' ?></td>
    <td><?= url_format($row['urls'], $seen) ?? '' ?></td>
    <td><?= $row['notes'] ?? '' ?></td>
  </tr>
<?php } ?>

  </tbody>
</table>
