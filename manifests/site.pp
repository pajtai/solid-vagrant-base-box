node default {
# mongo
  class { '::mongodb::globals':
    manage_package_repo => true,
    version             => '2.4.10'
  }->
  class { '::mongodb::server': }

# mysql
  class { '::mysql::server': }

  $tools = [
    'git-core',
    'curl',
    'build-essential',
    'dkms',
    'vim'
  ]
  package { $tools: ensure => 'installed' }

# remeber to add in ~/.zshrc
  ohmyzsh::install { 'vagrant': }

  class { 'nodejs':
    node_pkg    => 'nodejs01031',
    npm_pkg     => 'nodejs01031-npm',
  }

  package { 'express':
    ensure   => present,
    provider => 'npm',
  }

  class { 'nginx': }

  class { 'php': }
  php::module { 'php5-common': }
  php::module { 'php5-fpm': }
  php::module { 'php5-cli': }
  php::module { 'php5-curl': }
  php::module { 'php5-imagick': }
  php::module { 'php5-gd': }
  php::module { 'php5-xsl': }
  php::module { 'php5-mysql': }
  php::module { 'php5-mcrypt': }
  php::module { 'php5-dev': }
  php::module { 'php5-mongo': }

  service { 'php5-fpm':
    ensure  => 'running',
    require => Package['php5-fpm']
  }
}