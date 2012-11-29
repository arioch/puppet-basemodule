# = Class basemodule::params
#
class basemodule::params {

  $manage_repo = false

  case $::operatingsystem {
    'RedHat', 'CentOS', 'Scientific', 'OEL', 'Amazon', 'Fedora': {
      $config_dir         = '/etc/basemodule'
      $config_dir_mode    = '0755'
      $config_group       = 'root'
      $config_mode        = '0644'
      $config_user        = 'root'
      $daemon_group       = ''
      $daemon_user        = ''
      $log_dir            = ''
      $pid_file           = ''
      $pkg_deps           = undef
      $pkg_ensure         = present
      $pkg_list           = ''
      $service_dep        = undef
      $service_enable     = true
      $service_ensure     = running
      $service_hasrestart = ''
      $service_hasstatus  = ''
      $service_name       = 'basemodule'
    }

    'Debian', 'Ubuntu': {
      $config_dir         = '/etc/basemodule'
      $config_dir_mode    = '0755'
      $config_file_mode   = '0644'
      $config_group       = 'root'
      $config_user        = 'root'
      $daemon_group       = ''
      $daemon_user        = ''
      $log_dir            = ''
      $pid_file           = ''
      $pkg_deps           = undef
      $pkg_ensure         = present
      $pkg_list           = ''
      $service_dep        = undef
      $service_enable     = true
      $service_ensure     = running
      $service_hasrestart = ''
      $service_hasstatus  = ''
      $service_name       = 'basemodule'
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported yet."
    }
  }

}

