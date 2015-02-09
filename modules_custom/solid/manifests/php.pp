define solid::php {

# Install the php5-fpm and php5-cli packages
  package { [
    'php5-fpm',
    'php5-cli',
    'php5-common',
    'php5-curl',
    'php5-imagick',
    'php5-gd',
    'php5-xsl',
    'php5-mysql',
    'php5-mcrypt',
    'php5-dev',
    'php5-mongo',
  ]:
    ensure => present,
  }

# Make sure php5-fpm is running
  service { 'php5-fpm':
    ensure => running,
    require => Package['php5-fpm'],
  }

  file { [ "/var", "/var/www", "/var/www/ini" ]:
    ensure => directory,
    before => File ['setup php info file'],
  }

  file { 'setup php info file':
    path => '/var/www/ini/index.php',
    owner => 'www-data',
    group => 'www-data',
    mode   => 644,
    ensure => file,
    source => 'puppet:///modules/solid/index.php',
  }

}

