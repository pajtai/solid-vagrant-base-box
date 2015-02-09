define solid::initial {
  exec { 'run apt update':
    command => 'apt-get update -y',
    path => "/usr/bin",
    logoutput => true,
  }

  file { 'dependencies verification script':
    path => '/usr/local/bin/verification.sh',
    ensure => file,
    source => 'puppet:///modules/solid/verification.sh',
    mode => 751,
  }

}