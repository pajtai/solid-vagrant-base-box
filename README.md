### Solid Vagrant Box

This is a base Vagrant box. The box should be pulled down from AWS and used as the base in project `Vagrantfile`s.

This allows quick switching between files that share the same Vagrant box.

The box is located here:

#### Building the box

1. Install gem, bundler, and Vagrant
2. `bundle`
3. `librarian-vagrant install --verbose`
3. `vagrant up --provision`

#### Saving the box

1. `vagrant package my-virtual-machine`

```
sudo apt-get clean
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && exit
```
