<?php
function url_format($urls_string, &$seen) {
  if (!$urls_string) {
    return null;
  }
  $urls = explode(" ", $urls_string);
  $result = "";
  $first = true;
  foreach ($urls as $url) {
    if (!array_key_exists($url, $seen)) {
      $seen[$url] = count($seen) + 1;
    }
    $result .= ($first ? '' : ', ') . '<a href="' . $url . '">[' . $seen[$url] . ']</a>';
    $first = false;
  }
  return $result;
}

function link_person($person) {
  return '<a href="/?person=' . urlencode($person) . '">' . $person . '</a>';
}

function link_organization($organization) {
  return '<a href="/?organization=' . urlencode($organization) . '">'
    . $organization . '</a>';
}

function display_date(string $date, string $precision) {
  if ((!$date) && (!$precision)) {
    return "";
  }

  switch ($precision) {
  case "day":
    return '<span title="Precision known to day">' . $date . '</span>';
    break;
  case "month":
    return '<span title="Precision known to month">' . substr($date, 0, 7)
      . '<span style="color: #888">'
      . substr($date, 7) . '</span>' . '</span>';
    break;
  case "year":
    return '<span title="Precision known to year">' . substr($date, 0, 4)
      . '<span style="color: #888">'
      . substr($date, 4) . '</span>' . '</span>';
    break;
  default:
    return '<span title="Precision unknown">' . '<span style="color: #888">'
      . $date . '</span>' . '</span>';
  }
}
?>
