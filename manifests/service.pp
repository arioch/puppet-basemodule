# == Class basemodule::service
#
class basemodule::service {
  if $::basemodule::service_dep {
    service { $::basemodule::service_dep:
      ensure     => $::basemodule::service_ensure,
      enable     => $::basemodule::service_enable,
      hasrestart => $::basemodule::service_hasrestart,
      hasstatus  => $::basemodule::service_hasstatus,
      require    => Class['::basemodule::config'];
    }

    service { $::basemodule::service_name:
      ensure     => $::basemodule::service_ensure,
      enable     => $::basemodule::service_enable,
      hasrestart => $::basemodule::service_hasrestart,
      hasstatus  => $::basemodule::service_hasstatus,
      require    => [
        Service['::basemodule::service_dep'],
        Class['::basemodule::config'],
      ];
    }
  } else {
    service { $::basemodule::service_name:
      ensure     => $::basemodule::service_ensure,
      enable     => $::basemodule::service_enable,
      hasrestart => $::basemodule::service_hasrestart,
      hasstatus  => $::basemodule::service_hasstatus,
      require    => Class['::basemodule::config'];
    }
  }
}

