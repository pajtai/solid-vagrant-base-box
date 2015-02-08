define solid::node {

  class { 'nodejs':
    version => 'v0.10.26'
  }->

  package {'grunt-cli':
    ensure   => present,
    provider => 'npm'
  }
}