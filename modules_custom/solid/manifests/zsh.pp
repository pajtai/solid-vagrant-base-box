define solid::zsh {
# remember to add in ~/.zshrc

  class { 'ohmyzsh': }

# for the "vagrant" user
  ohmyzsh::install { ['root', 'vagrant'] : }

  ohmyzsh::theme { ['root', 'vagrant'] :
    theme => 'avit',
  }

  ohmyzsh::plugins { ['root', 'vagrant']:
    plugins => 'git',
  }
}