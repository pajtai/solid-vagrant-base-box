# -*- mode: ruby -*-
# vi: set ft=ruby :

unless Vagrant.has_plugin?("vagrant-exec")
  raise '

  ERROR:::::::::::::::::::
      vagrant-exec not installed, please do so using "vagrant plugin install vagrant-exec"!
          '
end
unless Vagrant.has_plugin?("vagrant-vbguest")
  raise '

  ERROR:::::::::::::::::::
      vagrant-vbguest not installed, please do so using "vagrant plugin install vagrant-vbguest"!
          '
end

Vagrant.configure("2") do |config|

  config.vm.box = "solid.0.1.0"
  config.vm.hostname = "solid"
  config.vbguest.no_remote = false

  config.vm.provider "virtualbox" do |v|
      v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]

      host = RbConfig::CONFIG['host_os']

        # Give VM 1/4 system memory & access to all cpu cores on the host
        if host =~ /darwin/
          cpus = `sysctl -n hw.ncpu`.to_i
          # sysctl returns Bytes and we need to convert to MB
          mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
        elsif host =~ /linux/
          cpus = `nproc`.to_i
          # meminfo shows KB and we need to convert to MB
          mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
        else # sorry Windows folks, I can't help you
          cpus = 2
          mem = 1024
        end

        v.customize ["modifyvm", :id, "--memory", mem]
        v.customize ["modifyvm", :id, "--cpus", cpus]
  end

    config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
    config.vm.network :forwarded_port, guest: 3306, host: 8306, auto_correct: true
    config.vm.network :forwarded_port, guest: 9200, host: 9200, auto_correct: true
    #config.vm.synced_folder "./", "/vagrant/app/targets", owner: 'www-data', group: 'www-data', extra: 'dmode=775,fmode=644'
    #config.vm.synced_folder "./", "/vagrant", owner: "www-data", group: "www-data"

    config.vm.network "private_network", ip: "192.168.12.138"
    #config.vm.synced_folder "./", "/vagrant", nfs: true

  #This next bit fixes the 'stdin is not a tty' error when shell provisioning Ubuntu boxes
  config.vm.provision :shell,
    #if there a line that only consists of 'mesg n' in /root/.profile, replace it with 'tty -s && mesg n'
    :inline => "(grep -q -E '^mesg n$' /root/.profile && sed -i 's/^mesg n$/tty -s \\&\\& mesg n/g' /root/.profile && echo 'Ignore the previous error about stdin not being a tty. Fixing it now...') || exit 0;"
  config.vm.provision :puppet do |puppet|
     puppet.module_path = ["modules", "modules_custom"]
     puppet.manifests_path = "manifests"
     puppet.manifest_file = "site.pp"
     puppet.options = [
        '--verbose',
        '--debug'
     ]
  end
  config.vm.provision :shell, :path => "bin/verification.sh"
  config.vm.provision :shell, :path => "bin/cleanup.sh"
end
