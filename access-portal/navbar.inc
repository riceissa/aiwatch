<?php
$menu_items = array(
  '<a href="/">Home</a>',
  '<a href="/about/">About</a>',
  '<a href="/compare.php">Compare</a>'
);

if ($subdomain === "aiwatch") {
  $menu_items[] = '<a href="/upcoming-people/">Upcoming people</a>';
}
?>
<nav>
  <?= implode(", ", $menu_items) ?>
</nav>
