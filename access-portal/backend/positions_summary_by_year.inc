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
  </tr></thead>
  <tbody>
    <?php foreach ($years as $y) { ?>
      <tr>
        <td><?= $y ?? "Unknown" ?></td>
        <td style="text-align: right;"><?= $byYear['start_date'][$y] ?? 0 ?></td>
        <td style="text-align: right;"><?= $byYear['end_date'][$y] ?? 0 ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
