class firefox::params {
  $owner = 'root'

  case $facts['os']['family'] {
    'debian': {
      case $facts['os']['name'] {
        'ubuntu': {
          $config = '/usr/lib/firefox/browser/defaults/preferences/00-puppet-preferences.js'
          $group = 'root'
        }
        default: {
          $config = '/usr/share/firefox-esr/browser/defaults/preferences/00-puppet-preferences.js'
          $group = 'root'
        }
      }
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
