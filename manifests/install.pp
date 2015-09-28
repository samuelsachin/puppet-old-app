class sachinpuppet::install {
  include sachinpuppet::params
  package { [$::sachinpuppet::params::apache_package_name, $sachinpuppet::params::apacheutils_package_name, $sachinpuppet::params::logrotate_package_name]:
    ensure => present,
  }
}