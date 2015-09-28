define sachinpuppet::vhost (
 $template='', 
 $app_hostname=''
){
  
  include sachinpuppet::params
  
  file {"$::sachinpuppet::params::sites_available_directory/${name}.conf":
    content => template($template),
    owner => 'root',
    group => 'root',
    mode => '0640',
    require => Class['sachinpuppet::install'],
    notify => sachinpuppet::Ensite["$name"]
  }
  
  sachinpuppet::ensite {"$name":
    require => File["$::sachinpuppet::params::sites_available_directory/${name}.conf"],
    notify => Class['sachinpuppet::service'],
  }

}

