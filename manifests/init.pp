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
# Sample Usage:--->>
#
class sachinpuppet {

file {'/etc/hosts' :
  content => template("sachinpuppet/hosts.erb"),
  owner  => 'root',
  group   => 'root',
  mode   =>  '0664'
  

   
}

}
