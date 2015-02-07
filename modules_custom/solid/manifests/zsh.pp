define solid::zsh {
# remember to add in ~/.zshrc

  class { 'ohmyzsh': }

# for the "vagrant" user
  ohmyzsh::install { 'vagrant': }
}