<?php
$menu_items = array(
  '<a href="/">Home</a>',
  '<a href="/about/">About</a>',
  '<a href="/compare.php">Compare</a>',
  '<span id="changeThemeMenu" style="display: none;">Change <a href="#" onclick="change_theme_color()">color</a></span>'
);

if ($subdomain === "aiwatch") {
  $menu_items[] = '<a href="/upcoming-people/">Upcoming people</a>';
}
?>
<nav>
  <?= implode(", ", $menu_items) ?>
</nav>
