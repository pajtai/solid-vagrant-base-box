### Solid Vagrant Box

This is a base Vagrant box. A snapshot of the box should be used as a starting point for projects.

This allows quick switching between files that share the same Vagrant box.

The box is located here:

#### Building the box

1. Install gem, bundler, and Vagrant
2. `bundle`
3. `librarian-vagrant install --verbose`
3. `vagrant up --provision` - do **not** run `sudo` or you will mess up you ~/.vagrant.d dir (where vagrant store a lot of stuff)

#### Saving the box

1. `vagrant package my-virtual-machine`

```
sudo apt-get clean
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && exit
```

#### Verifications

Are run at the end of the install, and the can always be run with `verify`

```

```

#### Conventions

Puppet classes describe types of boxes. Puppet defines are "mixins" to be used as needed... e.g. in classes.
Custom modules should not be mixed with forge modules.