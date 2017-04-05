class firefox (
  $config = $firefox::params::config,
  $owner = $firefox::params::owner,
  $group = $firefox::params::group,
) inherits firefox::params {

  if $::osfamily == 'freebsd' {
    $dirs = [
      '/usr/local/lib/firefox/browser/defaults',
      '/usr/local/lib/firefox/browser/defaults/preferences',
    ]
    file { $dirs:
      ensure => directory,
      owner  => 'root',
      group  => 'wheel',
      mode   => '0755',
      before => Concat[$config],
    }
  }

  concat { $config:
    ensure => present,
    owner  => $owner,
    group  => $group,
    mode   => '0644',
  }
}
