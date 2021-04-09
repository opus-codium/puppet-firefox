# @summary Manage a Firefox preference
#
# @param value Value of the preference
# @param locked Indicate if users are able to override this setting
define firefox::pref (
  Variant[Integer, Float, String, Boolean] $value,
  Boolean $locked = false,
) {
  include firefox

  if $value =~ String {
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
    target  => $firefox::preferences_file,
    content => "${function}(\"${name}\", ${quoted_value});\n",
  }
}
