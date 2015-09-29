class sachinpuppet::service {
  include sachinpuppet::params
  service { $::sachinpuppet::params::apache_service_name:
    ensure => stopped,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    require => Class['sachinpuppet::install'],
  }
}