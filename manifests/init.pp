# Class: lmmsweb
#
# This module manages lmmsweb
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#sambu
class lmmsweb {
  include lmmsweb::params
  include lmmsweb::install
  include lmmsweb::service
  
  file {'/etc/hosts':
    content => template("lmmsweb/hosts.conf.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }
  
  file {$lmmsweb::params::fqdnconf:
    content => "ServerName localhost",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Exec["$lmmsweb::params::a2enconf fqdn"]
  }
  
  exec {"$lmmsweb::params::a2enconf fqdn":
    require => File[$lmmsweb::params::fqdnconf],
    notify => Class['lmmsweb::service']
  }
  
  file {['/var/www/vhosts','/var/www/vhosts/lmmsweb.mapofmedicine.com']:
    ensure => directory,
    recurse => true,
    mode => '0755',
    owner => 'root',
    group => 'root'
  }
  
  lmmsweb::loadmodule {['rewrite', 'proxy']:
    require => Package[$::lmmsweb::params::apache_package_name],
  }
  
  lmmsweb::vhost {'lmmsweb.mapofmedicine.com':
    template      => "lmmsweb/localise.mapofmedicine.com.conf.erb",
    app_hostname  => "lmms-app.internal.mapofmedicine.com",
    
  }
}
