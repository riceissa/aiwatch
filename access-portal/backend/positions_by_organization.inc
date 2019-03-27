<h2 id="positions-grouped-by-organization">Positions grouped by organization</h2>
<?php
  $query = "select organization,group_concat(distinct person order by start_date desc SEPARATOR '|') as peeps,count(distinct person) as numPeeps from positions where true";
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
  if ($subdomain === "aiwatch") {
    $query .= " and cause_area = 'AI safety'";
  }
  $query .= " group by organization order by numPeeps desc";
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
        <td><?= link_organization($row['organization']) ?></td>
        <td style="text-align: right;"><?= $row['numPeeps'] ?></td>
        <td><?php
          $peepslist = explode('|', $row['peeps']);
          // MySQL group_concat limits to 1024 characters by default, so if we
          // reach that limit it usually means there is a partial name at the
          // end of the string (unless the end of the string coincides with the
          // end of a name), which we don't want. An example would be the
          // string ending in "Rachel Fong, Raf", where "Raf" is the start of
          // the next name. So remove the last element in the array.
          if (strlen($row['peeps']) == 1024) {
            array_splice($peepslist, count($peepslist) - 1, 1);
          }
          $res = array();
          foreach($peepslist as $peep) {
            array_push($res, link_person($peep));
          }
          echo implode(", ", $res);
          if (strlen($row['peeps']) == 1024) {
            echo " (this list is partial)";
          }
          ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
