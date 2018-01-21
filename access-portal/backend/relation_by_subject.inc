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
        <?php foreach ($relations as $r) {
          $filterArgs = array();
          if ($r) {
            $filterArgs[] = "relation=" . urlencode($r);
          }
          if ($s) {
            $filterArgs[] = "subject=" . urlencode($s);
          }
          $queryFilter = $filterArgs ? "/?" . implode("&amp;", $filterArgs) : "/"; ?>
          <td style="text-align: right;"><a href="<?= $queryFilter ?>"><?= $relationBySubject[$s][$r] ?? 0 ?></a></td>
        <?php } ?>
      </tr>
    <?php } ?>
  </tbody>
</table>
