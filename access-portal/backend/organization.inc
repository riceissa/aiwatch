<?php
$organization = $_REQUEST['organization'];
$seen = array();
?>

<h1>Information for <?= htmlspecialchars($organization) ?></h1>

<h2>Table of contents</h2>
<ul>
  <li><a href="#basic-information">Basic information</a></li>
  <li><a href="#staff-count-by-year">Staff count by year</a></li>
  <li><a href="#number-of-full-time-staff-at-the-beginning-each-year">Number of full-time staff at the beginning each year</a></li>
  <li><a href="#full-history-of-additions-and-subtractions">Full history of additions and subtractions</a></li>
  <li><a href="#list-of-people">List of people</a></li>
  <li><a href="#products">Products</a></li>
  <li><a href="#organization-documents">Organization documents</a></li>
  <li><a href="#documents">Documents</a></li>
  <li><a href="#similar-organizations">Similar organizations</a></li>
</ul>


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

  <?php if ($val = ($row['other_names'] ?? '')) { ?>
    <tr>
      <td>Other names</td>
      <td><?= implode(', ', explode('|', $val)) ?></td>
    </tr>
  <?php } ?>
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
  <?php if ($val = ($row['last_major_data_update_date'] ?? '')) { ?>
    <tr>
      <td>Last recorded date when we made major data updates for this org</td>
      <td><?= $val ?></td>
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
  <?php // if ($dlw = dlw_links_list($mysqli, $organization, $subdomain)) { ?>
    <tr>
      <td>Donations List Website (data still preliminary)</td>
      <td><?php // echo implode(", ", $dlw) ?></td>
    </tr>
  <?php // } ?>

  <?php
  if ($stmt = $mysqli->prepare("select * from agendas where associated_organizations REGEXP ?")) {
    $stmt->bind_param("s", $organization);
    $stmt->execute();
    $result = $stmt->get_result();
  }
  $agendas = array();
  while ($row = $result->fetch_assoc()) {
    $agendas[] = $row['name'];
  }
  ?>
  <?php if ($agendas) { ?>
    <tr>
      <td>Agendas</td>
      <td><?= implode(", ", array_map("link_agenda", $agendas)) ?></td>
    </tr>
  <?php } ?>
  </tbody>
</table>

<h2>Positions count by year</h2>

<p>Hover over a name to see the position and date range. This table only
includes positions where at least the start date is known. The positions count
can count the same person multiple times if they held different positions;
similarly, the list of staff may include the same person multiple times if
they held more than one position during a single year.
For each year, a person is included if they were at the organization for any
part of the year; this means the actual staff count at any point during
the year can be lower (or higher, if some staff held multiple positions in a
single year).</p>

<table>
  <thead>
    <tr>
      <th>Year</th>
      <th>Positions count</th>
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
    $query = "select person,title,case when title REGEXP 'board' then 'board member' when title REGEXP 'associate' then 'associate' when title REGEXP 'advisor' then 'advisor' when title REGEXP 'research' then 'researcher' else 'general staff' end as title_type,start_date,end_date from positions where organization = ? and start_date < ? and (end_date > ? or end_date is null)";
    if ($subdomain === "aiwatch") {
      $query .= " and cause_area = 'AI safety'";
    }
    if ($stmt = $mysqli->prepare($query)) {
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
        <td style="text-align: right;"><?= $staff_count ?></td>
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

<h2>Number of full-time staff at the beginning each year</h2>

<p>The following table lists some dates and people who were at the organization
on the given date (namely, the start of the year). The table may not list every
person who worked for the organization (e.g. they could have joined and left in
the middle of a single year). This table excludes associates, interns,
advisors, and board members.</p>

<table>
  <thead>
    <tr>
      <th>Date</th>
      <th>Staff count</th>
      <th>Staff</th>
    </tr>
  </thead>
  <tbody>

<?php
  for ($year = 2000; $year < date("Y")+1; $year++) {
    $query = "select title,person,start_date,end_date from positions where organization = ? and start_date <= ? and (end_date is null or end_date > ?) and title not REGEXP 'associate' and title not REGEXP 'intern' and title not REGEXP 'advisor' and title not REGEXP 'board'";
    if ($subdomain === "aiwatch") {
      $query .= " and cause_area = 'AI safety'";
    }
    if ($stmt = $mysqli->prepare($query)) {
      $date = strval($year)."-01-01";
      $stmt->bind_param("sss", $organization, $date, $date);
      $stmt->execute();
      $result = $stmt->get_result();
    }
    $staff = array();
    while ($row = $result->fetch_assoc()) {
      $staff[] = link_person($row['person'],
                             $row['title'] . ", " . $row['start_date'] . '–' . $row['end_date']);
    }
    sort($staff);
    if ($staff_count = ($mysqli->affected_rows)) { ?>
      <tr>
        <td><?= strval($year) . "-01-01" ?></td>
        <td style="text-align: right;"><?= $staff_count ?></td>
        <td><?= implode(", ", $staff) ?></td>
      </tr>
<?php
    }
  }
?>

  </tbody>
</table>

<h2>Full history of additions and subtractions</h2>

<p>This table shows the full change history of positions. Each row corresponds
to at least one addition or removal of a position. Additions are in green and
subtractions are in red. If a position name changed,
it is listed simultaneously as an addition (of the new name) and removal (of
the old name) and colored yellow. Additionally there are faded variants of each
color for visited links.</p>

<table>
  <thead>
    <tr>
      <th>Date</th>
      <th>Number of positions</th>
      <th>Number of positions added</th>
      <th>Number of positions removed</th>
      <th>Positions added</th>
      <th>Positions removed</th>
    </tr>
  </thead>
  <tbody>

<?php
    $staff_changes = array();
    $query = "select start_date,person,title from positions where organization = ?";
    if ($subdomain === "aiwatch") {
      $query .= " and cause_area = 'AI safety'";
    }
    $query .= " order by start_date";
    if ($stmt = $mysqli->prepare($query)) {
      $stmt->bind_param("s", $organization);
      $stmt->execute();
      $result = $stmt->get_result();
    }
    while ($row = $result->fetch_assoc()) {
      $staff_changes[] = array($row['start_date'], 1, $row['person'], $row['title']);
    }
    $query = "select end_date,person,title from positions where organization = ? and end_date is not null";
    if ($subdomain === "aiwatch") {
      $query .= " and cause_area = 'AI safety'";
    }
    $query .= " order by end_date";
    if ($stmt = $mysqli->prepare($query)) {
      $stmt->bind_param("s", $organization);
      $stmt->execute();
      $result = $stmt->get_result();
    }
    while ($row = $result->fetch_assoc()) {
      $staff_changes[] = array($row['end_date'], -1, $row['person'], $row['title']);
    }
    array_multisort($staff_changes);
    $staff_count = 0;
    $pos = 0;
    $summary = array();
    while ($pos < count($staff_changes)) {
      $curr_date = $staff_changes[$pos][0];
      $curr_additions = 0;
      $curr_subtractions = 0;
      $curr_staff_added = array();
      $curr_staff_subtracted = array();
      while ($pos < count($staff_changes) && $staff_changes[$pos][0] === $curr_date) {
        $change = $staff_changes[$pos][1];
        $staff_count = $staff_count + $change;
        if ($change > 0) {
          $curr_additions = $curr_additions + $change;
          $curr_staff_added[] = array($staff_changes[$pos][2], $staff_changes[$pos][3]);
        } else {
          $curr_subtractions = $curr_subtractions + $change;
          $curr_staff_subtracted[] = array($staff_changes[$pos][2], $staff_changes[$pos][3]);
        }
        $pos++;
      }
      $summary[$curr_date] = array();
      $summary[$curr_date]['staff_count'] = $staff_count;
      $summary[$curr_date]['additions'] = $curr_additions;
      $summary[$curr_date]['subtractions'] = $curr_subtractions;
      $summary[$curr_date]['staff_added'] = $curr_staff_added;
      $summary[$curr_date]['staff_subtracted'] = $curr_staff_subtracted;
    }
    foreach ($summary as $date => $val) {
      $staff_added = array();
      foreach ($val['staff_added'] as $p) {
        $color_style = ' class="added"';
        // Change color to yellow if the person was also subtracted. This means
        // it's just a position title change.
        foreach ($val['staff_subtracted'] as $q) {
          if ($p[0] === $q[0]) {
            $color_style = ' class="changed"';
            break;
          }
        }
        $staff_added[] = link_person($p[0], $p[1], $color_style);
      }
      $staff_subtracted = array();
      foreach ($val['staff_subtracted'] as $p) {
        $color_style = ' class="subtracted"';
        // Change color to yellow if the person was also added. This means
        // it's just a position title change.
        foreach ($val['staff_added'] as $q) {
          if ($p[0] === $q[0]) {
            $color_style = ' class="changed"';
            break;
          }
        }
        $staff_subtracted[] = link_person($p[0], $p[1], $color_style);
      }
?>
    <tr>
      <td><?= $date ?></td>
      <td style="text-align: right;"><?= $val['staff_count'] ?></td>
      <td style="text-align: right;"><?= $val['additions'] ?></td>
      <td style="text-align: right;"><?= $val['subtractions'] ?></td>
      <td><?= implode(", ", $staff_added) ?></td>
      <td><?= implode(", ", $staff_subtracted) ?></td>
    </tr>
<?php
    }
?>
  </tbody>
</table>

<?php
$query = "select * from positions where organization = ?";
if ($subdomain === "aiwatch") {
  $query .= " and cause_area = 'AI safety'";
}
if ($stmt = $mysqli->prepare($query)) {
  $stmt->bind_param("s", $organization);
  $stmt->execute();
  $result = $stmt->get_result();
}
?>
<h2 id="list-of-people">List of people (<?= $result->num_rows ?> <?= $result->num_rows == 1 ? "position" : "positions" ?>)</h2>

<table>
  <thead>
    <tr>
      <th>Person</th>
      <th>Title</th>
      <th>Start date</th>
      <th>End date</th>
      <?= $subdomain === "aiwatch" ? "<th>AI safety relation</th>" : "" ?>
      <?= $subdomain === "aiwatch" ? "<th>Subject</th>" : "" ?>
      <th>Employment type</th>
      <th>Source</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>

<?php
while ($row = $result->fetch_assoc()) {
?>
  <tr>
    <td><?= link_person($row['person']) ?></td>
    <td><?= $row['title'] ?? '' ?></td>
    <td><?= display_date($row['start_date'] ?? '',
      $row['start_date_precision'] ?? '') ?></td>
    <td><?= display_date($row['end_date'] ?? '',
      $row['end_date_precision'] ?? '') ?></td>
    <?php if ($subdomain === "aiwatch") { ?>
      <td title="<?= explain_ai_safety_relation($row['ai_safety_relation']) ?>"><?= $row['ai_safety_relation'] ?? '' ?></td>
      <td title="<?= explain_subject($row['subject']) ?>"><?= $row['subject'] ?? '' ?></td>
    <?php } ?>
    <td><?= $row['employment_type'] ?? '' ?></td>
    <td><?= url_format($row['urls'], $seen) ?? '' ?></td>
    <td><?= ($row['notes'] ?? '') ? formatted_notes($row['notes'], $seen) : "" ?></td>
  </tr>
<?php } ?>
  </tbody>
</table>

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
<h2 id="products">Products (<?= $result->num_rows ?> <?= $result->num_rows == 1 ? "product" : "products" ?>)</h2>

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
        <td><?= (($creators[$row['name']] ?? '') ? "With " .
                 implode(", ", $creators[$row['name']]) . ". " : "") .
                    formatted_notes($row['description'], $seen) ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>

<?php
  $query = "select * from organization_documents where affected_organizations regexp ? order by publication_date desc";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->bind_param("s", $organization);
    $stmt->execute();
    $result = $stmt->get_result();
  }
?>
<h2 id="organization-documents">Organization documents (<?= $result->num_rows ?> <?= $result->num_rows == 1 ? "document" : "documents" ?>)</h2>

<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Publication date</th>
      <th>Author</th>
      <th>Publisher</th>
      <th>Affected organizations</th>
      <th>Affected people</th>
      <th>Document scope</th>
      <th>Cause area</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><a href="<?= $row['url'] ?>"><?= $row['title'] ?></a></td>
        <td><?= $row['publication_date'] ?></td>
        <td><?= link_person($row['author']) ?></td>
        <td><?= $row['publisher'] ?></td>
        <td><?= implode(", ", array_map("link_organization", explode("|", $row['affected_organizations']))) ?></td>
        <td><?= implode(", ", array_map("link_person", explode("|", $row['affected_people']))) ?></td>
        <td><?= $row['document_scope'] ?></td>
        <td><?= $row['cause_area'] ?></td>
        <td><?= formatted_notes($row['notes'], $seen) ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>


<?php
  $query = "select * from documents where affected_organizations regexp ? or publisher regexp ? order by publication_date desc";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->bind_param("ss", $organization, $organization);
    $stmt->execute();
    $result = $stmt->get_result();
  }
?>
<h2 id="documents">Documents (<?= $result->num_rows ?> <?= $result->num_rows == 1 ? "document" : "documents" ?>)</h2>

<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Publication date</th>
      <th>Author</th>
      <th>Publisher</th>
      <th>Affected organizations</th>
      <th>Affected people</th>
      <th>Affected agendas</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><a href="<?= $row['url'] ?>"><?= $row['title'] ?></a></td>
        <td><?= $row['publication_date'] ?></td>
        <td><?= implode(", ", array_map("link_person", explode("|", $row['author']))) ?></td>
        <td><?= $row['publisher'] ?></td>
        <td><?= implode(", ", array_map("link_organization", explode("|", $row['affected_organizations']))) ?></td>
        <td><?= implode(", ", array_map("link_person", explode("|", $row['affected_people']))) ?></td>
        <td><?= implode(", ", array_map("link_agenda", explode("|", $row['affected_agendas']))) ?></td>
        <td><?= formatted_notes($row['notes'], $seen) ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>

<h2 id="similar-organizations">Similar organizations</h2>

<?php

if ($stmt = $mysqli->prepare("select person, organization from positions")) {
  $stmt->execute();
  $result = $stmt->get_result();
}
$org_people = array();
while ($row = $result->fetch_assoc()) {
  if (!in_array($row['person'], $org_people[$row['organization']] ?? [])) {
    $org_people[$row['organization']][] = $row['person'];
  }
}
$intersect_people = array();
$intersect_counts = array();
foreach($org_people[$organization] as $person) {
  foreach($org_people as $org => $people) {
    if (in_array($person, $people) && $org !== $organization) {
          $intersect_people[$org][] = $person;
          $intersect_counts[$org] = ($intersect_counts[$org] ?? 0) + 1;
    }
  }
}
arsort($intersect_counts);
?>

<table>
  <thead>
    <tr>
      <th>Organization</th>
      <th>Number of people in common</th>
      <th>List of people in common</th>
    </tr>
  </thead>
  <tbody>
<?php
    foreach($intersect_counts as $org => $count) {
      $people = $intersect_people[$org];
?>
    <tr>
      <td><a href="/intersect.php?organization1=<?= urlencode($organization) ?>&amp;organization2=<?= urlencode($org) ?>"><?= $org ?></a></td>
      <td style="text-align: right;"><?= $count ?></td>
      <td><?= implode(", ", array_map("link_person", $people)) ?></td>
    </tr>
<?php
    }
?>
  </tbody>
</table>
