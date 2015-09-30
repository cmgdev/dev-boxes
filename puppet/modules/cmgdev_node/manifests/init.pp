# == Class: cmgdev_node
#
# Sets up Node in a Docker container

class cmgdev_node {

  include 'docker'
  
  docker::image { 'node':
    docker_file => '/vagrant/docker/node/Dockerfile',
	tag => 'node',
  }
  
  file { 'purge_node_modules':
	path => '/vagrant/docker/node/node_modules',
	ensure => 'absent',
	force => 'true',
	tag => 'node',
  }
  
  docker::run { 'node':
	image => 'node',
	volumes => ['/vagrant/docker/node:/app'],
	ports => ['8080:8080'],
	tag => 'node',
	require => [ Docker::Image['node'], File['purge_node_modules'] ],
  }

}