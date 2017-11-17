class firefox (
  Stdlib::Absolutepath        $config,
  String                      $owner,
  String                      $group,
  Array[Stdlib::Absolutepath] $managed_directories,
  String                      $package,
  Enum['present', 'latest']   $package_ensure,
) {

  file { $managed_directories:
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => '0755',
    before => Concat[$config],
  }

  concat { $config:
    ensure => present,
    owner  => $owner,
    group  => $group,
    mode   => '0644',
  }

  package { $package:
    ensure => $package_ensure,
  }
}
