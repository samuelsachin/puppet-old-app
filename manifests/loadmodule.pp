define lmmsweb::loadmodule {
  
  include lmmsweb::params
  
  exec { "$::lmmsweb::params::a2enmod $name":
    require => Class['lmmsweb::install'],
    unless => "$::lmmsweb::params::readlink -e $lmmsweb::params::mods_enabled_directory/${name}.load",
    notify => Class['lmmsweb::service']   
  }

}