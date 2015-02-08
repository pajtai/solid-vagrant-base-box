define solid::initial {
  exec { 'run apt update':
    command => 'apt-get update -y',
    path => "/usr/bin",
    logoutput => true
  }
}