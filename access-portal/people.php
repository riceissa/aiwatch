<?php
  include_once("backend/globalVariables/passwordFile.inc");
  $query = "select distinct(person) as name from positions where cause_area = 'AI safety'";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->execute();
    $result = $stmt->get_result();
  }

  $people = array();
  while ($row = $result->fetch_assoc()) {
    $people[] = $row['name'];
  }

  $query = "select distinct(person) as name from people";
  if ($stmt = $mysqli->prepare($query)) {
    $stmt->execute();
    $result = $stmt->get_result();
  }
  while ($row = $result->fetch_assoc()) {
    $people[] = $row['name'];
  }
  $people = array_unique($people);
  sort($people);

  print "<!DOCTYPE html>\n";
  print '<html lang="en">';
  print "<head>";
  print "<title>List of all people</title>";
  print "</head>";
  print "<pre>";
  foreach ($people as $person) {
    print $person . "\n";
  }
  print "</pre>";
  print "</html>";
