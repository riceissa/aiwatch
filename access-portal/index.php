<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <title>AI Watch</title>
</head>
<body>
<?php
include_once("backend/globalVariables/passwordFile.inc");
include_once("backend/util.inc");
if ($_REQUEST['researcher']) {
  include("backend/researcher.inc");
} else if ($REQUEST['organization']) {
  include("backend/organization.inc");
} else { // Main index.php with no parameters
?>

Welcome!

<?php } ?>
</body>
</html>

