### Solid Vagrant Box - `0.1.0`

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
