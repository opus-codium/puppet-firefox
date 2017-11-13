class firefox (
  Stdlib::Absolutepath        $config,
  String                      $owner,
  String                      $group,
  Array[Stdlib::Absolutepath] $managed_directories,
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
}
