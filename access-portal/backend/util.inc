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
?>
