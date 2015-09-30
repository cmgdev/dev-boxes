# == Class: cmgdev_core
#
# Utilities installed on a standard vm

class cmgdev_core {

	$packages = ['vim', 'git', 'wget']

	class { 'timezone':
        timezone => 'America/Chicago',
        tag => 'core',
    }
    
    package { $packages:
        ensure => 'installed',
        tag => 'core',
    }
	
#	class { 'sudo':
#		purge               => false,
#		config_file_replace => false,
#		tag => 'core',
#	}
#	
#	sudo::conf { 'vagrant':
#      priority => 30,
#      content  => 'vagrant ALL=(ALL) NOPASSWD:ALL',
#	  require => Class['sudo'],
#	  tag => 'core',
#    }

}