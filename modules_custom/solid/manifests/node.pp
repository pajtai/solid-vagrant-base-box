define solid::node {

  class { 'nodejs':
    version => 'v0.10.26',
    target_dir => '/bin',
  }->

  package {'grunt-cli':
    ensure   => present,
    provider => 'npm'
  }

  file_line { "source profile":
    path    => "/home/vagrant/.zshrc",
    line    => 'source ~/.profile',
    match   => '^source ~/\.profile',
    require => Solid::Zsh["load zsh with oh my zsh theme"],
  }

  file_line { "add node path":
    path    => "/home/vagrant/.profile",
    # single quoted string, so no variable interpolation
    line    => 'export PATH=/usr/local/node/node-default/bin:$PATH',
    match   => '^export PATH',
  }
}