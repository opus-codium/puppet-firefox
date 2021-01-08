# @summary Manage the Firefox web browser
#
# @param config Path to Firefox's preferences configuration file
# @param owner User owning the preferences configuration file
# @param group Group owning the preferences configuration file
# @param managed_directories A list of directories to manage
# @param manage_package Manage the firefox package on the system
# @param package The name of the firefox package
# @param package_ensure Value of the ensure parameter of the firefox package
# @param package_provider Value of the provider parameter of the firefox package
class firefox (
  Stdlib::Absolutepath        $config,
  String                      $owner,
  String                      $group,
  Array[Stdlib::Absolutepath] $managed_directories,
  String                      $package,
  Enum['present', 'latest']   $package_ensure,
  Boolean                     $manage_package   = true,
  Optional[String[1]]         $package_provider = undef,
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

  if $manage_package {
    package { $package:
      ensure   => $package_ensure,
      provider => $package_provider,
    }
  }
}
