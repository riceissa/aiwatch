<?php
$person = $_REQUEST['person'];
$seen = array();

if ($stmt = $mysqli->prepare("select * from people where person = ?")) {
  $stmt->bind_param("s", $person);
  $stmt->execute();
  $result = $stmt->get_result();
  if ($result->num_rows < 1) {
    echo "<p>Person not found.</p></body></html>\n";
    http_response_code(404);
    die();
  }
}

?>

<h1>Information for <?= htmlspecialchars($person) ?></h1>

<h2>Table of contents</h2>
<ul>
  <li><a href="#basic-information">Basic information</a></li>
  <li><a href="#list-of-positions">List of positions</a></li>
  <li><a href="#products">Products</a></li>
  <li><a href="#organization-documents">Organization documents</a></li>
  <li><a href="#documents">Documents</a></li>
  <li><a href="#similar-people">Similar people</a></li>
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

  <?php // if ($dlw = dlw_links_list($mysqli, $person, $subdomain)) { ?>
    <tr>
      <td>Donations List Website (data still preliminary)</td>
      <td><?php // echo implode(", ", $dlw) ?></td>
    </tr>
  <?php // } ?>

  <?php
  if ($stmt = $mysqli->prepare("select * from agendas where associated_people REGEXP ?")) {
    $stmt->bind_param("s", $person);
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

<?php
$query = "select * from positions where person = ?";
if ($subdomain === "aiwatch") {
  $query .= " and cause_area = 'AI safety'";
}
$query .= " order by coalesce(start_date, end_date) asc";
if ($stmt = $mysqli->prepare($query)) {
  $stmt->bind_param("s", $person);
  $stmt->execute();
  $result = $stmt->get_result();
}
?>
<h2 id="list-of-positions">List of positions (<?= $result->num_rows ?> <?= $result->num_rows == 1 ? "position" : "positions" ?>)</h2>

<table>
  <thead>
    <tr>
      <th>Organization</th>
      <th>Title</th>
      <th>Start date</th>
      <th>End date</th>
      <?php if ($subdomain === "aiwatch") { ?>
        <th>AI safety relation</th>
        <th>Subject</th>
      <?php } ?>
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
    <td><?= link_organization($row['organization']) ?></td>
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
    <td><?= $row['notes'] ?? '' ?></td>
  </tr>
<?php } ?>

  </tbody>
</table>

<?php
    $creators = linkedCreators($mysqli,
        "select * from product_creators where product in (select product from product_creators where name = ?) and name != ?",
        "ss", $person, $person);

  $query = "select * from products where products.name in (select product from product_creators where name = ?);";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->bind_param("s", $person);
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
                 implode(", ", $creators[$row['name']]) . ". " : "")
                  . formatted_notes($row['description'], $seen) ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>

<?php
  $query = "select * from organization_documents where author = ? or affected_people regexp ? order by publication_date desc";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->bind_param("ss", $person, $person);
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
  $query = "select * from documents where author regexp ? or affected_people regexp ? order by publication_date desc";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->bind_param("ss", $person, $person);
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

<h2 id="similar-people">Similar people</h2>

<p>Showing at most 20 people who are most similar in terms of which
  organizations they have worked at.</p>

<?php

$query = "select person, organization from positions";
if ($subdomain === "aiwatch") {
  $query .= " where cause_area = 'AI safety'";
 }
if ($stmt = $mysqli->prepare($query)) {
  $stmt->execute();
  $result = $stmt->get_result();
}
$person_to_orgs = array();
while ($row = $result->fetch_assoc()) {
  if (!in_array($row['organization'], $person_to_orgs[$row['person']] ?? [])) {
    $person_to_orgs[$row['person']][] = $row['organization'];
  }
}
$intersect_list = array();
$intersect_counts = array();
foreach($person_to_orgs[$person] as $org) {
  foreach($person_to_orgs as $p => $os) {
    if (in_array($org, $os) && $p !== $person) {
          $intersect_list[$p][] = $org;
          $intersect_counts[$p] = ($intersect_counts[$p] ?? 0) + 1;
    }
  }
}
arsort($intersect_counts);
$intersect_counts = array_slice($intersect_counts, 0, 20);
?>

<table>
  <thead>
    <tr>
      <th>Person</th>
      <th>Number of organizations in common</th>
      <th>List of organizations in common</th>
    </tr>
  </thead>
  <tbody>
<?php
    foreach($intersect_counts as $p => $count) {
      $orgs = $intersect_list[$p];
?>
    <tr>
      <td><a href="/intersect.php?person1=<?= urlencode($person) ?>&amp;person2=<?= urlencode($p) ?>"><?= $p ?></a></td>
      <td style="text-align: right;"><?= $count ?></td>
      <td><?= implode(", ", array_map("link_organization", $orgs)) ?></td>
    </tr>
<?php
    }
?>
  </tbody>
</table>
