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

function date_guess(string $lowerGuess, string $upperGuess,
    string $startOrEnd) {
  $explanation = "The $startOrEnd date guess is";
  $start_lower_meaning = "the latest known date on which the person was doing"
    . " something other than the current position, prior to the"
    . " current position";
  $start_upper_meaning = "the earliest known date on which the person"
    . " held the position";
  $end_lower_meaning = "the latest known date on which the the person"
    . " held the position";
  $end_upper_meaning = "the earliest known date on which the person was doing"
    . " something other than the current position, after the current"
    . " position";

  if ($lowerGuess && $upperGuess) {
    // We have a lower and upper guess, so take the average for the guess.
    $guess = date('Y-m-d', (strtotime($upperGuess) + strtotime($lowerGuess)) / 2.0);
    $explanation .= " $guess;";

    if ($startOrEnd == "start") {
      $explanation .= " this is computed as the average of the lower guess"
        . " ($lowerGuess; $start_lower_meaning) and upper guess"
        . " ($upperGuess; $start_upper_meaning) of the start of the position.";
    } else {
      $explanation .= " this is computed as the average of the lower guess"
        . " ($lowerGuess; $end_lower_meaning) and upper guess"
        . " ($upperGuess; $end_upper_meaning) of the end of the position.";
    }
  } else if ($lowerGuess) {
    // We only have the lower guess, so use that.
    $guess = $lowerGuess;
    $explanation .= " $guess;";
    if ($startOrEnd == "start") {
      $explanation .= " this is the lower guess ($start_lower_meaning)"
        ." of the start of the position.";
    } else {
      $explanation .= " this is the lower guess ($end_lower_meaning)"
        ." of the end of the position.";
    }
  } else if ($upperGuess) {
    // We only have the upper guess, so use that.
    $guess = $upperGuess;
    $explanation .= " $guess;";
    if ($startOrEnd == "start") {
      $explanation .= " this is the upper guess ($start_upper_meaning)"
        ." of the start of the position.";
    } else {
      $explanation .= " this is the upper guess ($end_upper_meaning)"
        ." of the end of the position.";
    }
  } else {
    $guess = "";
    $explanation = "";
  }

  return array($guess, $explanation);

}

function display_date(string $date, string $precision, string $guess) {
  if ((!$date) && (!$precision) && (!$guess)) {
    return "";
  }
  if ((!$date) && (!$precision) && $guess) {
    return '<span style="color: #888"'
      .' title="Using guess; see notes column for explanation.">'
      . $guess . '</span>';
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
