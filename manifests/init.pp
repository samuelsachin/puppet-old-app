class sachinpuppet {
  include sachinpuppet::params
  include sachinpuppet::install
  include sachinpuppet::service
  
  
  file{'/etc/hosts':
    content => template("sachinpuppet/hosts.conf.erb"),
    owner => 'root',
    group => 'root',
    
  }
  
}