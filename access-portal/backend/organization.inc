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
if ($stmt = $mysqli->prepare("select organization from organizations where hosting_organization = ?")) {
  $stmt->bind_param("s", $organization);
  $stmt->execute();
  $result = $stmt->get_result();
}
$hosted_orgs = array();
while ($row = $result->fetch_assoc()) {
  $hosted_orgs[] = $row['organization'];
}

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
      <td><a href="https://www.youtube.com/<?= $val ?>"><?= $val ?></a></td>
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
  <?php if ($val = ($row['team_page'] ?? '')) { ?>
    <tr>
      <td>Team page</td>
      <td><a href="<?= $val ?>"><?= $val ?></a></td>
    </tr>
  <?php } ?>
  <?php if ($val = ($row['launch_date'] ?? '')) { ?>
    <tr>
      <td>Launch date</td>
      <td><?= display_date($val, $row['launch_date_precision'], "") ?></td>
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
  <?php if ($val = ($row['hosting_organization'] ?? '')) { ?>
    <tr>
      <td>Hosting organization</td>
      <td><?= link_organization($val) ?></td>
    </tr>
  <?php } ?>
  <?php if ($val = ($row['notes'] ?? '')) { ?>
    <tr>
      <td>Notes</td>
      <td><?= $val ?></td>
    </tr>
  <?php } ?>
  <?php if ($val = ($row['urls'] ?? '')) { ?>
    <tr>
      <td>Source</td>
      <td><?= url_format($val, $seen) ?></td>
    </tr>
  <?php } ?>

<?php } ?>
  <?php if ($hosted_orgs) { ?>
    <tr>
      <td>Hosted organizations</td>
      <td><?= implode(array_map("link_organization", $hosted_orgs)) ?></td>
    </tr>
  <?php } ?>
  <?php if ($dlw = dlw_links_list($mysqli, $organization)) { ?>
    <tr>
      <td>Donations List Website (data still preliminary)</td>
      <td><?= implode(", ", $dlw) ?></td>
    </tr>
  <?php } ?>
  </tbody>
</table>

<h2>Staff count by year</h2>

<table>
  <thead>
    <tr>
      <th>Year</th>
      <th>Staff count</th>
      <th>Researchers</th>
      <th>General staff</th>
      <th>Associates</th>
      <th>Board members</th>
      <th>Advisors</th>
    </tr>
  </thead>
  <tbody>

<?php
  for ($year = 2000; $year < date("Y")+1; $year++) {
    if ($stmt = $mysqli->prepare("select person,title,case when title REGEXP 'board' then 'board member' when title REGEXP 'associate' then 'associate' when title REGEXP 'advisor' then 'advisor' when title REGEXP 'research' then 'researcher' else 'general staff' end as title_type,start_date,end_date from positions where organization = ? and start_date < ? and (end_date > ? or end_date is null)")) {
      $start_date = strval($year+1)."-01-01";
      $end_date = strval($year)."-01-01";
      $stmt->bind_param("sss", $organization, $start_date, $end_date);
      $stmt->execute();
      $result = $stmt->get_result();
    }
    $board_members = array();
    $associates = array();
    $researchers = array();
    $general_staff = array();
    $advisors = array();
    while ($row = $result->fetch_assoc()) {
      switch ($row['title_type']) {
      case 'board member':
        $board_members[] = link_person($row['person'],
                                $row['title'] . ", " . $row['start_date'] . '–' . $row['end_date']);
        break;
      case 'associate':
        $associates[] = link_person($row['person'],
                                $row['title'] . ", " . $row['start_date'] . '–' . $row['end_date']);
        break;
      case 'researcher':
        $researchers[] = link_person($row['person'],
                                $row['title'] . ", " . $row['start_date'] . '–' . $row['end_date']);
        break;
      case 'general staff':
        $general_staff[] = link_person($row['person'],
                                $row['title'] . ", " . $row['start_date'] . '–' . $row['end_date']);
        break;
      case 'advisor':
        $advisors[] = link_person($row['person'],
                                $row['title'] . ", " . $row['start_date'] . '–' . $row['end_date']);
        break;
      }
    }
    sort($board_members);
    sort($associates);
    sort($researchers);
    sort($general_staff);
    sort($advisors);
    if ($staff_count = ($mysqli->affected_rows)) { ?>
      <tr>
        <td><?= $year ?></td>
        <td><?= $staff_count ?></td>
        <td><?= implode(", ", $researchers) ?></td>
        <td><?= implode(", ", $general_staff) ?></td>
        <td><?= implode(", ", $associates) ?></td>
        <td><?= implode(", ", $board_members) ?></td>
        <td><?= implode(", ", $advisors) ?></td>
      </tr>
<?php
    }
}
?>
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
      <th>AI safety relation</th>
      <th>Subject</th>
      <th>Employment type</th>
      <th>Source</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
<?php
if ($stmt = $mysqli->prepare("select * from positions where organization = ?")) {
  $stmt->bind_param("s", $organization);
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

<h2 id="products">Products</h2>
<?php
$creators = linkedCreators($mysqli,
    "select * from product_creators where product in (select product from product_creators where name = ?) and name != ?",
    "ss", $organization, $organization);

  $query = "select * from products where products.name in (select product from product_creators where name = ?);";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->bind_param("s", $organization);
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
        <td><?= ($creators[$row['name']] ? "With " .
                 implode(", ", $creators[$row['name']]) . ". " : "") .
                    formatted_notes($row['description'], $seen) ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
