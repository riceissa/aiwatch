<?php
function url_format($urls_string) {
  if (!$urls_string) {
    return null;
  }
  $urls = explode(" ", $urls_string);
  $result = "";
  for ($i = 0; $i < count($urls); $i++) {
    if ($i === 0) {
      $result .= '<a href="' . $urls[$i] . '">[' . ($i+1) . ']</a>';
    } else {
      $result .= ', <a href="' . $urls[$i] . '">[' . ($i+1) . ']</a>';
    }
  }
  return $result;
}
?>
