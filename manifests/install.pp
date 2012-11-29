# = Class basemodule::install
#
class basemodule::install {
  package { $::basemodule::pkg_list:
    ensure => $::basemodule::pkg_ensure,
  }
}

