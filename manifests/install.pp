class sachinpuppet::install {
  include sachinpuppet::params
  package { [$::sachinpuppet::params::apache_package_name]:
  ensure => present,
  }  
  
   
}