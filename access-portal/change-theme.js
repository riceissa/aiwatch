// License: CC0 https://creativecommons.org/publicdomain/zero/1.0/
// Modified from https://github.com/riceissa/issarice.com/blob/master/static/change-theme.js

function change_theme_read_cookie(name) {
  var cookies = document.cookie.split(';');
  for (var i = 0; i < cookies.length; i++) {
    var cs = cookies[i].split('=');
    if (cs[0].trimLeft() == name) {
      return cs.slice(1).join('=');
    }
  }
  return null;
}

function change_theme_color() {
  if (document.body.classList.contains("dark")) {
    document.body.classList.remove("dark");
    document.cookie = 'colorCookie=light; max-age=31536000; path=/; SameSite=None; Secure';
  } else {
    document.body.classList.add("dark");
    document.cookie = 'colorCookie=dark; max-age=31536000; path=/; SameSite=None; Secure';
  }
}

function set_theme_from_cookies_or_browser_preference() {
  let colorCookie = change_theme_read_cookie("colorCookie");
  if (colorCookie === "dark") {
    document.body.classList.add("dark");
  } else if (colorCookie === null && window.matchMedia("(prefers-color-scheme: dark)").matches) {
    change_theme_color();
  }
}
