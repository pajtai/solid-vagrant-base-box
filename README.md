### Solid Vagrant Box - `0.1.0`

#### Download a Release:

* [solid.0.1.0](https://github.com/pajtai/solid-vagrant-base-box/releases/download/0.1.0/solid.0.1.0.box)
    
(see [the features list](#010-features) for a breakdown.

This is a base Vagrant box. A snapshot of the box should be used as a starting point for projects.

This allows quick switching between files that share the same Vagrant box.

The box is located here:

#### Building the box

1. Install gem, bundler, and Vagrant
2. Pull dependencies and build the box:

    ```shell
    bundle
    librarian-vagrant install --verbose
    vagrant up --provision
    ```

#### Saving the box

1. `vagrant package my-virtual-machine`

#### Optional port forwarding and hosts management

The vagrant box forwards its port 80 to 8080, so in your host browser you have to use `:8080`.

To use port 80 instead use [`pf` on macs](https://gist.github.com/pajtai/16df0303d7948f0e4da8).

If you need to match host names use the `/etc/hosts` of your host:

```
# part of /etc/hosts
# http://my.test.host.com will now hit vagrant
127.0.0.1 my.test.host.com
```

Without pf and hosts file modifications `localhost:8080` will hit the Vagrant box.

#### Notes

* the project `modules` directory is reserved for modules pulled down by `librarian-puppet`
* the project `modules_custom` directory is - surprisingly - for custom modules not from forge
* `/etc/nginx/site-enabled` has one site listening at `www.local.info` - going there will show phpinfo();

#### Rough Feature List

To get the exact features look in [`manifests/site.pp`](https://github.com/pajtai/solid-vagrant-base-box/blob/master/manifests/site.pp) which pulls in from [`modules_custom`](https://github.com/pajtai/solid-vagrant-base-box/tree/master/modules_custom/solid/manifests).

##### 0.1.0 features:

* nginx, node, npm, grunt-cli, mongo, mysql, php fpm, git, curl, build-essential, dkms, vim, zsh, oh-my-zsh
