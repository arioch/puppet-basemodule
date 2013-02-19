# = Class basemodule
#
class basemodule (
  $config_dir         = $::basemodule::params::config_dir,
  $config_dir_mode    = $::basemodule::params::config_dir_mode,
  $config_dir_recurse = $::basemodule::params::config_dir_recurse,
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

