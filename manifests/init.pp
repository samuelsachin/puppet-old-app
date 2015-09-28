# Class: sachinpuppet
#
# This module manages sachinpuppet
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#sambu
class sachinpuppet {
  include sachinpuppet::params
  include sachinpuppet::install
  include sachinpuppet::service
  
  file {'/etc/hosts':
    content => template("sachinpuppet/hosts.conf.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }
  
  file {$sachinpuppet::params::fqdnconf:
    content => "ServerName localhost",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Exec["$sachinpuppet::params::a2enconf fqdn"]
  }
  
  exec {"$sachinpuppet::params::a2enconf fqdn":
    require => File[$sachinpuppet::params::fqdnconf],
    notify => Class['sachinpuppet::service']
  }
  
  file {['/var/www/vhosts','/var/www/vhosts/sachinpuppet.mapofmedicine.com']:
    ensure => directory,
    recurse => true,
    mode => '0755',
    owner => 'root',
    group => 'root'
  }
  
  sachinpuppet::loadmodule {['rewrite', 'proxy']:
    require => Package[$::sachinpuppet::params::apache_package_name],
  }
  
  sachinpuppet::vhost {'sachinpuppet.mapofmedicine.com':
    template      => "sachinpuppet/localise.mapofmedicine.com.conf.erb",
    app_hostname  => "lmms-app.internal.mapofmedicine.com",
    
  }
}
