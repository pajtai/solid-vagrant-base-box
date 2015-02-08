define solid::packages {

  include apt
  apt::ppa { 'ppa:git-core/ppa': }
  apt::ppa { 'ppa:ondrej/php5': }
  apt::ppa { 'ppa:chris-lea/node.js': }

  $tools = [
    'git',
    'curl',
    'build-essential',
    'dkms',
    'vim',
    'nodejs'
  ]

  package {
    $tools: ensure => 'latest'
  }
}