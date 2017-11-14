<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <title>AI Watch</title>
  <link rel="stylesheet" href="/tablesorter.css">
  <script src="/jquery.min.js"></script>
  <script src="/jquery.tablesorter.js"></script>
<?php include_once("style.inc"); ?>
<?php include_once("analytics.inc"); ?>
</head>
<body>
<nav>
<a href="/">Home</a>
</nav>
<?php
include_once("backend/globalVariables/passwordFile.inc");
include_once("backend/util.inc");
if ($_REQUEST['person'] ?? '') {
  include("backend/person.inc");
} else if ($_REQUEST['organization'] ?? '') {
  include("backend/organization.inc");
} else { // Main index.php with no parameters
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

  $query = "select * from people";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->execute();
    $result2 = $stmt->get_result();
  }

  $query = "select count(*) as n from (select person from positions union select person from people) x";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->execute();
    $result3 = $stmt->get_result();
  }
  while ($row = $result3->fetch_assoc()) {
    $num_people = $row['n'];
  }

  $seen_people = array();
?>

<h1>AI Watch</h1>

<p>Welcome! See the <a href="https://github.com/riceissa/aiwatch">code repository</a> for the source code and data of this website.</p>

<h2>Table of contents</h2>

<ul>
  <li><a href="#positions-grouped-by-person">Positions grouped by person</a></li>
  <li><a href="#positions-grouped-by-organization">Positions grouped by organization</a></li>
  <li>Organizations</li>
  <li>People</li>
</ul>

<h2 id="positions-grouped-by-person">Positions grouped by person</h2>

<p>Showing <?= $num_people ?> people.</p>

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
    $seen_people[$row['person']] = 1;
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
<?php }

  while ($row = $result2->fetch_assoc()) {
    if (!array_key_exists($row['person'], $seen_people)) { ?>
      <tr>
        <td><?= link_person($row['person']) ?></td>
        <td style="text-align: right;">0</td>
        <td>N/A</td>
      </tr>

<?php
    }
  }
?>
  </tbody>
</table>

<h2 id="positions-grouped-by-organization">Positions grouped by organization</h2>
<?php
  $query = "select organization,group_concat(distinct person order by person SEPARATOR '|') as peeps,count(distinct person) as numPeeps from positions where true group by organization order by numPeeps desc";
  if ($stmt = $mysqli->prepare($query)) {
    if ($params) {
      $stmt->bind_param($param_str, ...$params);
    }
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
        <td><?= $row['organization'] ?></td>
        <td><?= $row['numPeeps'] ?></td>
        <td><?php
          $peepslist = explode('|', $row['organization']);
          $res = array();
          foreach($peepslist as $peep) {
            array_push($res, link_person($peep));
          }
          echo implode(", ", $res); ?></td>
      </tr>
<?php } ?>

    </tbody>
  </table>

<?php } ?>

<script>
    $(function(){$("table").tablesorter();});
</script>
</body>
</html>

