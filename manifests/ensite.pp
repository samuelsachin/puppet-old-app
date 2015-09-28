define lmmsweb::ensite {
  
  include lmmsweb::params

  exec { "$::lmmsweb::params::a2ensite $name":
    require => Class['lmmsweb::install'],
    unless => "$::lmmsweb::params::readlink -e $lmmsweb::params::sites_enabled_directory/${name}.conf",
    notify => Class['lmmsweb::service']   
  }

}