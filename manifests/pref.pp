define firefox::pref(
  Variant[Integer, Float, String, Boolean] $value,
  Boolean $locked = false,
) {
  include firefox

  if is_string($value) {
    $quoted_value = inline_template('<%= @value.inspect %>')
  } else {
    $quoted_value = $value
  }

  if $locked {
    $function = 'lockPref'
  } else {
    $function = 'pref'
  }

  concat::fragment { $name:
    target  => $firefox::config,
    content => "${function}(\"${name}\", ${quoted_value});\n",
  }
}
