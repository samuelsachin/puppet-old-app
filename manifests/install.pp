class lmmsweb::install {
  include lmmsweb::params
  package { [$::lmmsweb::params::apache_package_name, $lmmsweb::params::apacheutils_package_name, $lmmsweb::params::logrotate_package_name]:
    ensure => present,
  }
}