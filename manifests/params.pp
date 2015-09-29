class sachinpuppet::params{
  
  case $::osfamily{
    Debian: {
    $apache_package_name = 'apache2'
    $apache_service_name = 'apache2'
    $apacheutils_package_name = 'apache2-utils'
      
      
      
    }
    
    RedHat: {
      $apache_package_name = 'httpd'
      $apache_service_name = 'httpd'
      
      
      
      
    }
    
    
    default:{
      
      fail("sachinpuppet does not support osfamily - $::osfamily")
    }
    
  }
  
  
  
  
  
  
  
  
  
}