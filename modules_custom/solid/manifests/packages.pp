define solid::packages {

  include apt
  apt::ppa { 'ppa:git-core/ppa': }
  apt::ppa { 'ppa:ondrej/php5': }

  $tools = [
    'git',
    'curl',
    'build-essential',
    'dkms',
    'vim',
  ]

  package {
    $tools: ensure => 'latest'
  }
}