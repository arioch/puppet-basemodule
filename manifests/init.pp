# == Class basemodule
#
# $config_dir::           Location of the main configuration directory.
#                         Default: operating system specific.
#
# $config_dir_mode::      Posix file mode for configuration directories.
#                         Default: 0755.
#
# $config_dir_recurse::   Apply the same posix permissions as $config_dir to any
#                         directory contained in $config_dir.
#                         Default: false.
#
# $config_file::          Location of the main configuration file.
#                         Default: operating system specific.
#
# $config_file_mode::     Posix file mode for configuration files.
#                         Default: 0644.
#
# $config_group::         Posix group for configuration files.
#                         Default: operating system specific.
#
# $config_purge::         Whether or not to purge non-puppet managed files
#                         contained in $config_dir.
#                         Default: operating system specific.
#
# $config_user::          Posix user for configuration files.
#                         Default: operating system specific.
#
# $daemon_group::         Unprivileged group to run daemon.
#                         Default: operating system specific.
#
# $daemon_user::          Unprivileged user to run daemon.
#                         Default: operating system specific.
#
# $log_dir::              Specify directory containing log files.
#                         Default: operating system specific.
#
# $manage_repo::          Add a custom package repository.
#                         Default: false.
#
# $pid_file::             Specify where to save the pid file.
#                         Default: operating system specific.
#
# $pkg_deps::             Any dependencies that need to be resolved before
#                         installing the main package.
#                         Default: operating system specific.
#
# $pkg_ensure::           Ensure state for packages.
#                         Default: present.
#
# $pkg_list::             An array containing the main package and possibly
#                         a number of dependencies.
#                         Default: operating system specific.
#
# $service_dep::          Specify the name of any dependent daemon.
#                         Default: undef.
#
# $service_enable::       Enable/disable the daemon at boot time.
#                         Default: true.
#
# $service_ensure::       Ensure daemon state
#                         Default: running.
#
# $service_hasrestart::   Specify whether or not the init script has restart.
#                         Default: operating system specific.
#
# $service_hasstatus::    Specify whether or not the init script has status.
#                         Default: operating system specific.
#
# $service_name::         Specify the name of the init script.
#                         Default: operating system specific.
#
class basemodule (
  $config_dir         = $::basemodule::params::config_dir,
  $config_dir_mode    = $::basemodule::params::config_dir_mode,
  $config_dir_recurse = $::basemodule::params::config_dir_recurse,
  $config_file        = $::basemodule::params::config_file,
  $config_file_mode   = $::basemodule::params::config_file_mode,
  $config_group       = $::basemodule::params::config_group,
  $config_purge       = $::basemodule::params::config_purge,
  $config_user        = $::basemodule::params::config_user,
  $daemon_group       = $::basemodule::params::daemon_group,
  $daemon_user        = $::basemodule::params::daemon_user,
  $log_dir            = $::basemodule::params::log_dir,
  $manage_repo        = $::basemodule::params::manage_repo,
  $pid_file           = $::basemodule::params::pid_file,
  $pkg_deps           = $::basemodule::params::pkg_deps,
  $pkg_ensure         = $::basemodule::params::pkg_ensure,
  $pkg_list           = $::basemodule::params::pkg_list,
  $service_dep        = $::basemodule::params::service_dep,
  $service_enable     = $::basemodule::params::service_enable,
  $service_ensure     = $::basemodule::params::service_ensure,
  $service_hasrestart = $::basemodule::params::service_hasrestart,
  $service_hasstatus  = $::basemodule::params::service_hasstatus,
  $service_name       = $::basemodule::params::service_name,
) inherits basemodule::params {
  class { 'basemodule::install': } ->
  class { 'basemodule::config': } ~>
  class { 'basemodule::service': } ->
  Class [ 'basemodule' ]
}

