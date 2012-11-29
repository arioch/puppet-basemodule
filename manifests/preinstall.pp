# = Class basemodule::preinstall
#
class basemodule::preinstall {
  if $::basemodule::manage_repo {

    $apt_repo_key = ''

    case $::operatingsystem {
      'RedHat', 'CentOS', 'Scientific', 'OEL', 'Amazon', 'Fedora': {
        yumrepo { 'repo':
          descr    => 'descr',
          baseurl  => 'basurl',
          gpgkey   => 'gpgkey',
          enabled  => 1,
          gpgcheck => 1;
        }
      }

      'Debian', 'Ubuntu': {
        apt::key { $apt_repo_key:
          ensure => present,
          notify => Exec['basemodule apt-get update'],
        }

        if defined('::apt::source') {
          # Puppetlabs/apt module
          apt::source { 'repo':
            location    => 'baseurl',
            release     => $::lsbdistcodename,
            repos       => 'main',
            include_src => false,
            key         => $apt_repo_key,
          }
        }

        if defined('::apt::sources_list') {
          # Camp2Camp/apt module
          apt::sources_list { 'repo':
            ensure  => present,
            source  => false,
            content => '',
            notify  => Exec['apt-get update'],
            require => Apt::Key[$apt_repo_key],
          }
        }

        exec { 'basemodule apt-get update':
          command     => 'apt-get update',
          path        => '/usr/bin',
          refreshonly => true,
        }
      }

      default: {
        fail "Operating system ${::operatingsystem} is not supported yet."
      }
    }
  }
}

