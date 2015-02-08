# each of the files in manifests has to be included for the full box
# to test things out, include only that

# load our customizations
solid::apt            { "set apt": } ->
solid::initial        { "update": } ->
solid::php            { "load php fpm with modules": } ->
solid::database       { "load all databases": }

solid::nginx          { "start nginx": }
solid::node           { "install node and npm": }
solid::packages       { "packages": }
solid::zsh            { "load zsh with oh my zsh theme": }
