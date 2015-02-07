define solid::node {

  class { 'nodejs':
    version => 'v0.10.25'
  }

  package { 'grunt-cli':
    provider => 'npm',
    require  => Class['nodejs']
  }
}