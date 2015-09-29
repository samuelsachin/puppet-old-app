class sachinpuppet::service {
  include sachinpuppet::params
  service { $::sachinpuppet::params::apache_service_name:
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    require => Class['sachinpuppet::install'],
  }
}