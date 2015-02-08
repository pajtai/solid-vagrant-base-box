define solid::packages {

  $tools = [
    'git',
    'curl',
    'build-essential',
    'dkms',
    'vim'
  ]

  package {
    $tools: ensure => 'latest'
  }
}