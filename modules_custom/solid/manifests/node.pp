define solid::node {

  package {'grunt-cli':
    ensure   => present,
    provider => 'npm',
    require  => Package['nodejs'],
  }
}