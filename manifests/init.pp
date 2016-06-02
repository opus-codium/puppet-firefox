class firefox {
  $conf = $osfamily ? {
    'FreeBSD' => '/usr/local/lib/firefox/browser/defaults/preferences/all-romain.js',
    'Debian'  => '/usr/share/iceweasel/browser/defaults/preferences/all-romain.js',
  }

  $group = $osfamily ? {
    'FreeBSD' => 'wheel',
    default   => 'root',
  }

  if $osfamily == 'FreeBSD' {
    $dirs = [
      '/usr/local/lib/firefox/browser/defaults',
      '/usr/local/lib/firefox/browser/defaults/preferences',
    ]
    file { $dirs:
      ensure => directory,
      owner  => 'root',
      group  => 'wheel',
      mode   => '0755',
      before => Concat[$conf],
    }
  }

  concat { $conf:
    ensure => present,
    owner  => 'root',
    group  => $group,
    mode   => '0644',
  }
}
