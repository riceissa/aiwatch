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
    $result .= ($first ? '' : ', ') . '<a href="' . htmlspecialchars($url) . '">[' . $seen[$url] . ']</a>';
    $first = false;
  }
  return $result;
}

function formatted_notes($notes, &$seen) {
  $resList = array();
  $words = explode(" ", $notes);
  foreach ($words as $w) {
    if ((substr($w, 0, 7) === "http://") || (substr($w, 0, 8) === "https://")) {
      $resList[] = url_format($w, $seen);
    } else if ((substr($w, 0, 8) === "<http://") ||
               (substr($w, 0, 9) === "<https://")) {
      $end = strpos($w, ">");
      $resList[] = url_format(substr($w, 1, $end-1), $seen) . substr($w, $end+1);
    } else {
      $resList[] = $w;
    }
  }
  return implode(" ", $resList);
}

function link_person($person, $title_text = '', $style = '') {
  $ps = explode("; ", $person);
  $linked = array_map(
    function ($p) use ($title_text, $style) {
      return '<a href="/?person=' . urlencode($p) . '"'
        . ($title_text ? ' title="' . htmlspecialchars($title_text) . '"' : '') . $style . '>' . $p . '</a>';
    },
    $ps);
  return implode("; ", $linked);
}

function link_organization($organization) {
  return '<a href="/?organization=' . urlencode($organization) . '">'
    . $organization . '</a>';
}

function link_agenda($agenda) {
  return '<a href="/?agenda=' . urlencode($agenda) . '">'
    . $agenda . '</a>';
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


function dlw_links_list($mysqli, $entity, $subdomain) {
  $dlw = array();
  if ($subdomain === "aiwatch") {
    $query = "select * from donations.donations where substring_index(cause_area,'/',1) = 'AI safety' and donor = ? limit 1";
    $url = "https://donations.vipulnaik.com/donor.php?donor=%s&amp;cause_area_filter=AI+safety";
  } else {
    $query = "select * from donations.donations where donor = ? limit 1";
    $url = "https://donations.vipulnaik.com/donor.php?donor=%s";
  }
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->bind_param("s", $entity);
    $stmt->execute();
    $result = $stmt->get_result();
  }
  while ($row = $result->fetch_assoc()) {
    $dlw[] = sprintf(
      '<a href="%s">%s</a>',
      sprintf($url, urlencode($entity)),
      "donor"
    );
  }

  if ($subdomain === "aiwatch") {
    $query = "select * from donations.donations where substring_index(cause_area,'/',1) = 'AI safety' and donee = ? limit 1";
    $url = "https://donations.vipulnaik.com/donee.php?donee=%s&amp;cause_area_filter=AI+safety";
  } else {
    $query = "select * from donations.donations where donee = ? limit 1";
    $url = "https://donations.vipulnaik.com/donee.php?donee=%s";
  }
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->bind_param("s", $entity);
    $stmt->execute();
    $result = $stmt->get_result();
  }
  while ($row = $result->fetch_assoc()) {
    $dlw[] = sprintf(
      '<a href="%s">%s</a>',
      sprintf($url, urlencode($entity)),
      "donee"
    );
  }
  return $dlw;
}


function explain_ai_safety_relation($relation) {
  switch ($relation) {
  case "position":
    return "The position itself is known to be relevant to AI safety, either because we know something about the position or because the position is at an organization exclusively focused on AI safety.";
    break;
  case "AGI organization":
    return "The position is at a safety-conscious organization aiming for artificial general intelligence, so it is possible the position is relevant to AI safety, but it could also be unrelated.";
    break;
  case "GCR organization":
    return "The position is at an organization aiming to reduce global catastrophic risks or existential risks, so it is possible the position is relevant to AI safety, but it could also be unrelated.";
    break;
  case "unrelated":
    return "The position is unrelated to AI safety, but is included to show context for other positions.";
    break;
  default:
    return "The relation to AI safety is unknown or not yet entered in the database.";
  }
}


function explain_subject($subject) {
  switch ($subject) {
  case "technical research":
    return "This position involves technical research.";
    break;
  case "software engineering":
    return "This position involves software engineering.";
  case "background":
    return "This position involves background research.";
  case "popularization":
    return "This position involves popularization.";
  case "general":
    return "This position involves general work like office management.";
  case "policy":
    return "This position involves policy work.";
  default:
    return "The subject area is unknown or not yet entered in the database.";
  }
}


/**
 * Get an array where the keys are product names, and the values are a list of
 * creators for that product. Each creator is an HTML link that can be
 * displayed.
 *
 * @param mysqli $mysqli The mysqli connection.
 * @param string $query  The SQL query to use. This query must select from the
 *                       product_creators table.
 * @param string $types  The types for the parameters passed to the query. This
 *                       is just like the $types in a mysqli bind_param call.
 * @param        $params The parameters to send to the query.
 */
function linkedCreators($mysqli, $query, $types, ...$params)
{
    if ($stmt = $mysqli->prepare($query)) {
        if ($types) {
            $stmt->bind_param($types, ...$params);
        }
        $stmt->execute();
        $result = $stmt->get_result();
    }

    // Store the creators associated with each product, except for the creator
    // whose page we are already on.
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

    return $creators;
}

function anchorText(string $text)
{
    $text = strtolower($text);
    $text = str_replace(array('&', ','), "", $text);
    $text = preg_replace('/\s+/', '-', $text);
    $text = urlencode($text);
    return $text;
}
?>
