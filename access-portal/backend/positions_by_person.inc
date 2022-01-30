<?php
  $query = "select person,group_concat(distinct organization order by organization SEPARATOR '|') as orgs,count(distinct organization) as numOrgs from positions where true";
  $param_str = "";
  $params = array();
  if ($_REQUEST['subject'] ?? '') {
    $query .= " and subject = ?";
    $param_str .= "s";
    $params[] = $_REQUEST['subject'];
  }
  if ($_REQUEST['relation'] ?? '') {
    $query .= " and ai_safety_relation = ?";
    $param_str .= "s";
    $params[] = $_REQUEST['relation'];
  }
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
  if ($subdomain === "aiwatch") {
    $query .= " and cause_area = 'AI safety'";
  }
  $query .= " group by person";

  // See https://github.com/riceissa/aiwatch/issues/98 for where the "limit
  // with ties" idea is introduced.
  $limitWithTies = 300;
  $query .= " having count(distinct organization) >= (select count(distinct organization) from positions group by person order by count(distinct organization) desc limit $limitWithTies, 1)";

  $query .= " order by count(distinct organization) desc";
  if ($stmt = $mysqli->prepare($query)) {
    if ($params) {
      $stmt->bind_param($param_str, ...$params);
    }
    $stmt->execute();
    $result = $stmt->get_result();
  }


?>

<h2 id="positions-grouped-by-person">Positions grouped by person</h2>

<p>Showing <?= $mysqli->affected_rows ?> people with positions. Display is limited to <?= $limitWithTies ?> people (but includes ties, so may show more than <?= $limitWithTies ?> people).</p>

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
