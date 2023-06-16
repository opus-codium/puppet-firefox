# @summary Manage the Firefox web browser
#
# @param directory Base directory of Firefox's installation
# @param owner User owning the configuration files
# @param group Group owning the configuration files
# @param package The name of the firefox package
# @param package_ensure Value of the ensure parameter of the firefox package
# @param manage_package Manage the firefox package on the system
# @param package_provider Value of the provider parameter of the firefox package
# @param managed_directories A list of directories to manage
# @param preferences_file Path to Firefox's preferences configuration file
# @param policies_file Path to Firefox's policies file
# @param policies The policies to deploy, see https://github.com/mozilla/policy-templates for the structure of this Hash
class firefox (
  Stdlib::Absolutepath        $directory,
  Optional[String[1]]         $owner,
  Optional[String[1]]         $group,
  String                      $package,
  Enum['present', 'latest']   $package_ensure,
  Boolean                     $manage_package   = true,
  Optional[String[1]]         $package_provider = undef,
  Array[String[1]]            $managed_directories = [
    'browser/defaults',
    'browser/defaults/preferences',
    'distribution',
  ],
  Stdlib::Absolutepath        $preferences_file = "${directory}/browser/defaults/preferences/00-puppet-preferences.js",
  Stdlib::Absolutepath        $policies_file    = "${directory}/distribution/policies.json",
  Hash                        $policies         = {},
) {
  if $manage_package {
    package { $package:
      ensure   => $package_ensure,
      provider => $package_provider,
    }
    $require = Package[$package]
  } else {
    $require = undef
  }

  file { $managed_directories.map |$d| { "${directory}/${d}" }:
    ensure  => directory,
    owner   => $owner,
    group   => $group,
    mode    => '0755',
    require => $require,
    before  => [
      Concat[$preferences_file],
      File[$policies_file],
    ],
  }

  concat { $preferences_file:
    ensure => present,
    owner  => $owner,
    group  => $group,
    mode   => '0644',
  }

  file { $policies_file:
    ensure  => file,
    owner   => $owner,
    group   => $group,
    mode    => '0644',
    content => {
      policies => $policies,
    }.stdlib::to_json(),
  }
}
