define sachinpuppet::loadmodule {
  
  include sachinpuppet::params
  
  exec { "$::sachinpuppet::params::a2enmod $name":
    require => Class['sachinpuppet::install'],
    unless => "$::sachinpuppet::params::readlink -e $sachinpuppet::params::mods_enabled_directory/${name}.load",
    notify => Class['sachinpuppet::service']   
  }

}