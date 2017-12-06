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

<h1>AI Watch</h1>

<p>Welcome! This is a website to track people and organizations working on AI safety. See the <a href="https://github.com/riceissa/aiwatch">code repository</a> for the source code and data of this website.</p>

<p>This website is developed by <a href="https://issarice.com">Issa Rice</a>
  and is partially
  <a href="https://contractwork.vipulnaik.com/tasks.php?receptacle=AI+Watch&amp;matching=exact">funded by Vipul Naik</a>.</p>

<p>This site is still under active development.</p>

<p>Last updated on <?= $head_date ?>.</p>

<h2 id="table-of-contents">Table of contents</h2>

<ul>
  <li><a href="#positions-grouped-by-person">Positions grouped by person</a></li>
  <li><a href="#positions-grouped-by-organization">Positions grouped by organization</a></li>
  <li><a href="#individuals-not-affiliated-with-any-organization">Individuals
    not affiliated with any organization</a></li>
</ul>

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
        <td><?= $row['numPeeps'] ?></td>
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

<?php } ?>

<script>
    $(function(){$("table").tablesorter();});
    anchors.add();
</script>
</body>
</html>

