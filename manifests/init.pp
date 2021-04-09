# @summary Manage the Firefox web browser
#
# @param directory Base directory of Firefox's installation
# @param owner User owning the preferences configuration file
# @param group Group owning the preferences configuration file
# @param managed_directories A list of directories to manage
# @param manage_package Manage the firefox package on the system
# @param package The name of the firefox package
# @param package_ensure Value of the ensure parameter of the firefox package
# @param package_provider Value of the provider parameter of the firefox package
# @param preferences_file Path to Firefox's preferences configuration file
class firefox (
  Stdlib::Absolutepath        $directory,
  Optional[String[1]]         $owner,
  Optional[String[1]]         $group,
  Array[String[1]]            $managed_directories,
  String                      $package,
  Enum['present', 'latest']   $package_ensure,
  Boolean                     $manage_package   = true,
  Optional[String[1]]         $package_provider = undef,
  Stdlib::Absolutepath        $preferences_file = "${directory}/browser/defaults/preferences/00-puppet-preferences.js",
) {
  file { $managed_directories.map |$d| { "${directory}/${d}" }:
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => '0755',
    before => Concat[$preferences_file],
  }

  concat { $preferences_file:
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
