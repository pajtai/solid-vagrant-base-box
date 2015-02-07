# each of the files in manifests has to be included for the full box
# to test things out, include only that

# start with a base box that is updated
stage { 'initial':
  before => Stage['main']
}
class {'solid::initial':
  stage => initial
}

# load our customizations
solid::packages       { "load default packages": } ->
solid::zsh            { "load zsh with oh my zsh theme": }
solid::database       { "load all databases": }
solid::node           { "load node and global npms": }
solid::php            { "load php fpm with modules": }
solid::nginx          { "start nginx": }
