define solid::nginx {

  class { 'nginx': }

  file { 'vagrant-nginx':
    path => '/etc/nginx/sites-available/phpini',
    ensure => file,
    owner => 'www-data',
    group => 'www-data',
    mode   => 0644,
    source => 'puppet:///modules/solid/phpini.conf',
  }

# Symlink our vhost in sites-enabled to enable it
  file { 'vagrant-nginx-enable':
    path => '/etc/nginx/sites-enabled/phpini',
    target => '/etc/nginx/sites-available/phpini',
    ensure => link,
    notify => Service['nginx'],
    require => [
      File['vagrant-nginx'],
    ],
  }
}