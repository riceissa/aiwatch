<?php
$organization = $_REQUEST['organization'];
$seen = array();
?>

<h1>Information for <?= htmlspecialchars($organization) ?></h1>

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
if ($stmt = $mysqli->prepare("select * from organizations where organization = ?")) {
  $stmt->bind_param("s", $organization);
  $stmt->execute();
  $result = $stmt->get_result();
}
while ($row = $result->fetch_assoc()) { ?>

  <?php if ($val = ($row['country'] ?? '')) { ?>
    <tr>
      <td>Country</td>
      <td><?= $val ?></td>
    </tr>
  <?php } ?>
  <?php if ($val = ($row['facebook_username'] ?? '')) { ?>
    <tr>
      <td>Facebook username</td>
      <td><a href="https://www.facebook.com/<?= $val ?>"><?= $val ?></a></td>
    </tr>
  <?php } ?>
  <?php if ($val = ($row['youtube_username'] ?? '')) { ?>
    <tr>
      <td>YouTube username</td>
      <td><a href="https://www.youtube.com/user/<?= $val ?>"><?= $val ?></a></td>
    </tr>
  <?php } ?>
  <?php if ($val = ($row['twitter_username'] ?? '')) { ?>
    <tr>
      <td>Twitter username</td>
      <td><a href="https://twitter.com/<?= $val ?>"><?= $val ?></a></td>
    </tr>
  <?php } ?>
  <?php if ($val = ($row['medium_username'] ?? '')) { ?>
    <tr>
      <td>Twitter username</td>
      <td><a href="https://medium.com/@<?= $val ?>"><?= $val ?></a></td>
    </tr>
  <?php } ?>
  <?php if ($val = ($row['website'] ?? '')) { ?>
    <tr>
      <td>Website</td>
      <td><a href="<?= $val ?>"><?= $val ?></a></td>
    </tr>
  <?php } ?>
  <?php if ($val = ($row['wikipedia_page'] ?? '')) { ?>
    <tr>
      <td>Wikipedia page</td>
      <td><a href="<?= $val ?>"><?= $val ?></a></td>
    </tr>
  <?php } ?>
  <?php if ($val = ($row['timelines_wiki_page'] ?? '')) { ?>
    <tr>
      <td>Timelines Wiki page</td>
      <td><a href="<?= $val ?>"><?= $val ?></a></td>
    </tr>
  <?php } ?>
  <?php if ($val = ($row['urls'] ?? '')) { ?>
    <tr>
      <td>Source</td>
      <td><?= url_format($val, $seen) ?></td>
    </tr>
  <?php } ?>

<?php } ?>
  </tbody>
</table>

<h2>List of people</h2>

<table>
  <thead>
    <tr>
      <th>Person</th>
      <th>Title</th>
      <th>Start date</th>
      <th>End date</th>
      <th>Source</th>
      <th>Notes</th>
    <tr>
  </thead>
  <tbody>
<?php
if ($stmt = $mysqli->prepare("select * from positions where organization = ?")) {
  $stmt->bind_param("s", $organization);
  $stmt->execute();
  $result = $stmt->get_result();
}

while ($row = $result->fetch_assoc()) { ?>
  <tr>
    <td><?= link_person($row['person']) ?></td>
    <td><?= $row['title'] ?? '' ?></td>
    <td><?= $row['start_date'] ?? '' ?></td>
    <td><?= $row['end_date'] ?? '' ?></td>
    <td><?= url_format($row['urls'], $seen) ?? '' ?></td>
    <td><?= $row['notes'] ?? '' ?></td>
  </tr>
<?php } ?>
  </tbody>
</table>
