# = Class basemodule::install
#
class basemodule::install {
  package { $::basemodule::pkg_list:
    ensure => $::basemodule::pkg_ensure,
  }

  if $::basemodule::pkg_deps {
    package { $::basemodule::pkg_deps:
      ensure => $::basemodule::pkg_ensure,
      before => Package[$::basemodule::pkg_list],
    }
  }
}

