define firefox::pref(
  Variant[Integer, Float, String, Boolean] $value,
) {
  include firefox

  if is_string($value) {
    $quoted_value = inline_template('<%= @value.inspect %>')
  } else {
    $quoted_value = $value
  }

  concat::fragment { $name:
    target  => $firefox::config,
    content => "pref(\"${name}\", ${quoted_value});\n"
  }
}
