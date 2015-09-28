define sachinpuppet::ensite {
  
  include sachinpuppet::params

  exec { "$::sachinpuppet::params::a2ensite $name":
    require => Class['sachinpuppet::install'],
    unless => "$::sachinpuppet::params::readlink -e $sachinpuppet::params::sites_enabled_directory/${name}.conf",
    notify => Class['sachinpuppet::service']   
  }

}