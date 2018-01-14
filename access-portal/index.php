<!DOCTYPE html>
<html lang="en">
<?php
$head_date = trim(file_get_contents("head_date.txt"));
$title = "";
if ($_REQUEST['person'] ?? '') {
  $title = htmlspecialchars($_REQUEST['person']);
} else if ($_REQUEST['organization'] ?? '') {
  $title = htmlspecialchars($_REQUEST['organization']);
}
?>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <meta name="dcterms.date" content="<?= $head_date ?>">
  <meta property="og:title" content="<?= $title ? $title : "AI Watch" ?>" />
  <meta property="og:site_name" content="AI Watch" />
  <meta property="og:locale" content="en_US" />
  <title><?= $title ? $title . " - AI Watch" : "AI Watch" ?></title>
  <link rel="stylesheet" href="/tablesorter.css">
  <script src="/jquery.min.js"></script>
  <script src="/jquery.tablesorter.js"></script>
  <script src="/anchor.min.js"></script>
<?php include_once("style.inc"); ?>
<?php include_once("analytics.inc"); ?>
</head>
<body>
<nav>
  <a href="/">Home</a>,
  <a href="/about/">About</a>
</nav>
<?php
include_once("backend/globalVariables/passwordFile.inc");
include_once("backend/util.inc");
if ($_REQUEST['person'] ?? '') {
  include("backend/person.inc");
} else if ($_REQUEST['organization'] ?? '') {
  include("backend/organization.inc");
} else { // Main index.php with no parameters
?>
<h1>AI Watch</h1>

<p>Welcome! This is a website to track people and organizations working on AI safety. See the <a href="https://github.com/riceissa/aiwatch">code repository</a> for the source code and data of this website.</p>

<p>This website is developed by <a href="https://issarice.com">Issa Rice</a>
  and is partially
  <a href="https://contractwork.vipulnaik.com/tasks.php?receptacle=AI+Watch&amp;matching=exact">funded by Vipul Naik</a>.</p>

<p>This site is still under active development.</p>

<p>Last updated on <?= $head_date ?>.</p>

<h2 id="table-of-contents">Table of contents</h2>

<ul>
  <li><a href="#ai-safety-relation-by-subject">AI safety relation by subject</a></li>
  <li><a href="#positions-summary-by-year">Positions summary by year</a></li>
  <li><a href="#positions-grouped-by-person">Positions grouped by person</a></li>
  <li><a href="#positions-grouped-by-organization">Positions grouped by organization</a></li>
  <li><a href="#individuals-not-affiliated-with-any-organization">Individuals
    not affiliated with any organization</a></li>
  <li><a href="#products">Products</a></li>
</ul>

<h2 id="ai-safety-relation-by-subject">AI safety relation by subject</h2>

<p>Note: as shown by the large number of “unknown” values, most of the
  positions haven’t been categorized by relation/subject so this table will
  only be useful in the future.</p>

<?php
  $relationBySubject = array();
  $relations = array();
  $subjects = array();
  $query = "select ai_safety_relation,subject,count(*) as num from positions group by ai_safety_relation, subject";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->execute();
    $result = $stmt->get_result();
  }
  while ($row = $result->fetch_assoc()) {
    if (!in_array($row['ai_safety_relation'], $relations)) {
      $relations[] = $row['ai_safety_relation'];
    }
    if (!in_array($row['subject'], $subjects)) {
      $subjects[] = $row['subject'];
    }
    $relationBySubject[$row['subject']][$row['ai_safety_relation']] = $row['num'];
  }
  sort($relations);
  sort($subjects);
?>
<table>
  <thead><tr>
    <th>Subject</th>
      <?php
        foreach ($relations as $r) {
          echo '<th>' . ($r ?? 'Unknown') . '</th>';
        }
      ?>
  </tr></thead>
  <tbody>
    <?php foreach ($subjects as $s) { ?>
      <tr>
        <td><?= $s ?? "Unknown" ?></td>
        <?php foreach ($relations as $r) { ?>
          <td style="text-align: right;"><?= $relationBySubject[$s][$r] ?? 0 ?></td>
        <?php } ?>
      </tr>
    <?php } ?>
  </tbody>
</table>

<?php
  $years = array();
  $byYear = array();

  // Runs the by-year query for the given field and stores the result in $years
  // (containing a list of unique years) and $byYear (containing the actual
  // numbers of positions).
  function get_by_year_data($mysqli, string $field, &$years, &$byYear) {
    $query = "select year($field) as year, count(*) as num"
      ." from positions group by year($field)";
    if ($stmt = $mysqli->prepare($query)) {
      $stmt->execute();
      $result = $stmt->get_result();
    }
    while ($row = $result->fetch_assoc()) {
      if (!in_array($row['year'], $years)) {
        $years[] = $row['year'];
      }
      $byYear[$field][$row['year']] = $row['num'];
    }
  }

  get_by_year_data($mysqli, "start_date", $years, $byYear);
  get_by_year_data($mysqli, "end_date", $years, $byYear);
  get_by_year_data($mysqli, "start_date_lower_guess", $years, $byYear);
  get_by_year_data($mysqli, "start_date_upper_guess", $years, $byYear);
  get_by_year_data($mysqli, "end_date_lower_guess", $years, $byYear);
  get_by_year_data($mysqli, "end_date_upper_guess", $years, $byYear);

  sort($years);
?>
<h2 id="positions-summary-by-year">Positions summary by year</h2>

<p>Note: as shown by the large number of “unknown” values, most of the
  positions haven’t been categorized by start/end dates so this table will only
  be useful in the future.</p>

<table>
  <thead><tr>
    <th>Year</th>
    <th>Start date</th>
    <th>End date</th>
    <th>Start date lower guess</th>
    <th>Start date upper guess</th>
    <th>End date lower guess</th>
    <th>End date upper guess</th>
  </tr></thead>
  <tbody>
    <?php foreach ($years as $y) { ?>
      <tr>
        <td><?= $y ?? "Unknown" ?></td>
        <td style="text-align: right;"><?= $byYear['start_date'][$y] ?? 0 ?></td>
        <td style="text-align: right;"><?= $byYear['end_date'][$y] ?? 0 ?></td>
        <td style="text-align: right;"><?= $byYear['start_date_lower_guess'][$y] ?? 0 ?></td>
        <td style="text-align: right;"><?= $byYear['start_date_upper_guess'][$y] ?? 0 ?></td>
        <td style="text-align: right;"><?= $byYear['end_date_lower_guess'][$y] ?? 0 ?></td>
        <td style="text-align: right;"><?= $byYear['end_date_upper_guess'][$y] ?? 0 ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>


<?php
  $query = "select person,group_concat(distinct organization order by organization SEPARATOR '|') as orgs,count(distinct organization) as numOrgs from positions where true";
  $param_str = "";
  $params = array();
  if ($_REQUEST['filter_title'] ?? '') {
    $query .= " and title REGEXP ?";
    $param_str .= "s";
    array_push($params, $_REQUEST['filter_title']);
  }
  if ($start_date = ($_REQUEST['start_date'] ?? '')) {
    if ((substr($start_date, 0, 1) === '<') || (substr($start_date, 0, 1) === '>')) {
      $relation = $start_date[0];
      $query .= " and start_date $relation ?";
      $param_str .= "s";
      array_push($params, substr($start_date, 1));
    }
  }
  if ($_REQUEST['end_date'] ?? '') {
    if ((substr($end_date, 0, 1) === '<') || (substr($end_date, 0, 1) === '>')) {
      $relation = $end_date[0];
      $query .= " and end_date $relation ?";
      $param_str .= "s";
      array_push($params, substr($end_date, 1));
    }
  }
  $query .= " group by person order by count(distinct organization) desc";
  if ($stmt = $mysqli->prepare($query)) {
    if ($params) {
      $stmt->bind_param($param_str, ...$params);
    }
    $stmt->execute();
    $result = $stmt->get_result();
  }


?>

<h2 id="positions-grouped-by-person">Positions grouped by person</h2>

<p>Showing <?= $mysqli->affected_rows ?> people with positions.</p>

<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Number of organizations</th>
      <th>List of organizations</th>
    </tr>
  </thead>
  <tbody>
<?php
  while ($row = $result->fetch_assoc()) {
?>
    <tr>
      <td><?= link_person($row['person']) ?></td>
      <td style="text-align: right;"><?= $row['numOrgs'] ?></td>
      <td><?php
            $orglist = explode('|', $row['orgs']);
            $res = array();
            foreach($orglist as $org) {
              array_push(
                $res,
                link_organization($org)
              );
            }
            echo implode(", ", $res); ?></td>
    </tr>
<?php } ?>
  </tbody>
</table>

<h2 id="positions-grouped-by-organization">Positions grouped by organization</h2>
<?php
  $query = "select organization,group_concat(distinct person order by person SEPARATOR '|') as peeps,count(distinct person) as numPeeps from positions where true group by organization order by numPeeps desc";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->execute();
    $result = $stmt->get_result();
  }
?>

<p>Showing <?= $mysqli->affected_rows ?> organizations.</p>

<table>
  <thead>
    <tr>
      <th>Organization</th>
      <th>Number of people</th>
      <th>List of people</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><?= link_organization($row['organization']) ?></td>
        <td style="text-align: right;"><?= $row['numPeeps'] ?></td>
        <td><?php
          $peepslist = explode('|', $row['peeps']);
          $res = array();
          foreach($peepslist as $peep) {
            array_push($res, link_person($peep));
          }
          echo implode(", ", $res); ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>

<h2 id="individuals-not-affiliated-with-any-organization">Individuals
  not affiliated with any organization</h2>
<?php
  $query = "select person,website,urls from people where person not in (select distinct(person) from positions)";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->execute();
    $result = $stmt->get_result();
  }
  $seen = array();
?>
<p>Showing <?= $mysqli->affected_rows ?> people.</p>
<table>
  <thead>
    <tr>
      <th>Organization</th>
      <th>Website</th>
      <th>Source</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><?= link_person($row['person']) ?></td>
        <td><?= ($val = $row['website']) ? '<a href="' . $val . '">' . $val . '</a>' : ''?></td>
        <td><?= url_format($row['urls'], $seen) ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>

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

<?php } ?>

<script>
    $(function(){$("table").tablesorter();});
    anchors.add();
</script>
</body>
</html>
