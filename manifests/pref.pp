define firefox::pref(
  $value,
) {
  include firefox

  if is_string($value) {
    $quoted_value = "'${value}'"
  } else {
    $quoted_value = $value
  }

  concat::fragment { $name:
    target  => $firefox::config,
    content => "pref('${name}', ${quoted_value});\n"
  }
}
