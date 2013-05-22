# = Class basemodule::params
#
class basemodule::params {
  $manage_repo = false

  case $::operatingsystem {
    'RedHat': {
      $config_dir         = '/etc/basemodule'
      $config_dir_mode    = '0755'
      $config_dir_recurse = false
      $config_group       = 'root'
      $config_mode        = '0644'
      $config_purge       = false
      $config_user        = 'root'
      $daemon_group       = undef
      $daemon_user        = undef
      $log_dir            = undef
      $pid_file           = undef
      $pkg_deps           = undef
      $pkg_ensure         = present
      $pkg_list           = undef
      $service_dep        = undef
      $service_enable     = true
      $service_ensure     = running
      $service_hasrestart = undef
      $service_hasstatus  = undef
      $service_name       = 'basemodule'
    }

    'Debian': {
      $config_dir         = '/etc/basemodule'
      $config_dir_mode    = '0755'
      $config_dir_recurse = false
      $config_file_mode   = '0644'
      $config_group       = 'root'
      $config_user        = 'root'
      $daemon_group       = undef
      $daemon_user        = undef
      $log_dir            = undef
      $pid_file           = undef
      $pkg_deps           = undef
      $pkg_ensure         = present
      $pkg_list           = undef
      $service_dep        = undef
      $service_enable     = true
      $service_ensure     = running
      $service_hasrestart = undef
      $service_hasstatus  = undef
      $service_name       = 'basemodule'
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported yet."
    }
  }
}

