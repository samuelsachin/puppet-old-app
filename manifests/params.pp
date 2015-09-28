class lmmsweb::params {
  case $::osfamily {
    Debian: {
      $apache_package_name = 'apache2'
      $apacheutils_package_name = 'apache2-utils'
      $logrotate_package_name   = 'logrotate'
      $apache_service_name = 'apache2'
      $vhost_conf_template = 'lmmsweb/localise.mapofmedicine.com.conf.erb'
      $sites_enabled_directory = "/etc/apache2/sites-enabled"
      $sites_available_directory = "/etc/apache2/sites-available"
      $mods_enabled_directory = "/etc/apache2/mods-enabled"
      $mods_available_directory = "/etc/apache2/mods-available"
      $a2enmod = "/usr/sbin/a2enmod"
      $a2ensite = "/usr/sbin/a2ensite"
      $a2enconf = "/usr/sbin/a2enconf"
      $fqdnconf = "/etc/apache2/conf-available/fqdn.conf"
      $readlink = "/bin/readlink"
      
    }
    RedHat: {
      $apache_package_name = 'httpd'
      $apache_service_name = 'httpd'
      $vhost_conf_template = 'lmmsweb/localise.mapofmedicine.com.conf.erb'
      $sites_enabled_directory = "/etc/httpd/sites-enabled"
    }
    default: {
      fail("lmmsweb doesn't support osfamily - $::osfamily")
    }
  }
}