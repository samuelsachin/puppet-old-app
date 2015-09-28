class lmmsweb::service {
  include lmmsweb::params
  service { $::lmmsweb::params::apache_service_name:
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    require => Class['lmmsweb::install'],
  }
}