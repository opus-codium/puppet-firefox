class firefox::params {
  $owner = 'root'

  case $::osfamily {
    'debian': {
      $config = '/usr/share/firefox-esr/browser/defaults/preferences/00-puppet-preferences.js'
      $group = 'root'
    }
    'freebsd': {
      $config = '/usr/local/lib/firefox/browser/defaults/preferences/00-puppet-preferences.js'
      $group = 'wheel'
    }
    default: {
      fail("unsupported osfamily ${::osfamily}")
    }
  }
}
