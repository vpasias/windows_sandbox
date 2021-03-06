# -*- mode: ruby -*-
# # vi: set ft=ruby :
Vagrant.configure("2") do |config|  
  config.vagrant.plugins = "vagrant-reload"
  config.vm.define "dc1" do |subconfig|
    subconfig.vm.box = "gusztavvargadr/windows-server"
    subconfig.vm.hostname = "dc1"
    subconfig.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.memory = 16*1024
      vb.cpus = 4
      vb.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      vb.customize ['modifyvm', :id, '--nicpromisc2', 'allow-all']
    end
    subconfig.vm.network "private_network", ip: "192.168.11.2", 
      name: "vboxnet0", :adapter => 2
    #	    virtualbox__intnet: true  
    subconfig.vm.network "forwarded_port", guest: 33389, host: 9011
    subconfig.winrm.username = "vagrant"
    subconfig.winrm.password = "vagrant"
    subconfig.winrm.transport = :plaintext
    subconfig.winrm.basic_auth_only = true 
    #Install DSC Modules
    subconfig.vm.provision "shell",
      path: "provision/PreDSCInstall.ps1"
    #https://github.com/dsccommunity/ActiveDirectoryDsc
    subconfig.vm.provision "shell",
      path: "provision/DSCInstallDomain.ps1"
    #Restart VM to finish Active Directory Domain Services installation
    subconfig.vm.provision :reload
    #https://github.com/dsccommunity/xDhcpServer
    subconfig.vm.provision "shell",
      path: "provision/DSCInstallDHCP.ps1"
    subconfig.vm.provision "shell",
      run: "always",
      inline: "route /p add 0.0.0.0 mask 0.0.0.0 192.168.11.1"
  end
    
  config.vm.define "cs1" do |subconfig|
    subconfig.vm.box = "gusztavvargadr/windows-server"
    subconfig.vm.hostname = "cs1"
    subconfig.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.memory = 16*1024
      vb.cpus = 4
      vb.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      vb.customize ['modifyvm', :id, '--nicpromisc2', 'allow-all']
    end
    subconfig.vm.network "private_network", ip: "192.168.11.10", 
      name: "vboxnet0", :adapter => 2
    subconfig.vm.network "forwarded_port", guest: 33389, host: 9012
    subconfig.winrm.username = "vagrant"
    subconfig.winrm.password = "vagrant"
    subconfig.winrm.transport = :plaintext
    subconfig.winrm.basic_auth_only = true
    subconfig.vm.provision "shell",
      run: "always",
      inline: "route /p add 0.0.0.0 mask 0.0.0.0 192.168.11.1"
    subconfig.vm.provision "shell",
      path: "provision/ConfigureRebootOnNode.ps1"    
    subconfig.vm.provision "shell",
      path: "provision/PreDSCInstall.ps1"
    subconfig.vm.provision "shell",
      path: "provision/DSCJoinDomain.ps1"
  end
  
  config.vm.define "cs2" do |subconfig|
    subconfig.vm.box = "gusztavvargadr/windows-server"
    subconfig.vm.hostname = "cs2"
    subconfig.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.memory = 16*1024
      vb.cpus = 4
      vb.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      vb.customize ['modifyvm', :id, '--nicpromisc2', 'allow-all']
    end
    subconfig.vm.network "private_network", ip: "192.168.11.11", 
      name: "vboxnet0", :adapter => 2
    subconfig.vm.network "forwarded_port", guest: 33389, host: 9013 
    subconfig.winrm.username = "vagrant"
    subconfig.winrm.password = "vagrant"
    subconfig.winrm.transport = :plaintext
    subconfig.winrm.basic_auth_only = true
    subconfig.vm.provision "shell",
      run: "always",
      inline: "route /p add 0.0.0.0 mask 0.0.0.0 192.168.11.1"
    subconfig.vm.provision "shell",
      path: "provision/ConfigureRebootOnNode.ps1"    
    subconfig.vm.provision "shell",
      path: "provision/PreDSCInstall.ps1"
    subconfig.vm.provision "shell",
      path: "provision/DSCJoinDomain.ps1"
  end
  
  config.vm.define "cs3" do |subconfig|
    subconfig.vm.box = "gusztavvargadr/windows-server"
    subconfig.vm.hostname = "cs3"
    subconfig.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.memory = 16*1024
      vb.cpus = 4
      vb.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      vb.customize ['modifyvm', :id, '--nicpromisc2', 'allow-all']
    end
    subconfig.vm.network "private_network", ip: "192.168.11.12", 
      name: "vboxnet0", :adapter => 2
    subconfig.vm.network "forwarded_port", guest: 33389, host: 9014
    subconfig.winrm.username = "vagrant"
    subconfig.winrm.password = "vagrant"
    subconfig.winrm.transport = :plaintext
    subconfig.winrm.basic_auth_only = true
    subconfig.vm.provision "shell",
      run: "always",
      inline: "route /p add 0.0.0.0 mask 0.0.0.0 192.168.11.1"
    subconfig.vm.provision "shell",
      path: "provision/ConfigureRebootOnNode.ps1"    
    subconfig.vm.provision "shell",
      path: "provision/PreDSCInstall.ps1"
    subconfig.vm.provision "shell",
      path: "provision/DSCJoinDomain.ps1"
  end

  config.vm.define "ss1" do |subconfig|
    subconfig.vm.box = "gusztavvargadr/windows-server"
    subconfig.vm.hostname = "ss1"
    subconfig.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.memory = 16*1024
      vb.cpus = 4
      vb.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      vb.customize ['modifyvm', :id, '--nicpromisc2', 'allow-all']
    end
    subconfig.vm.network "private_network", ip: "192.168.11.13", 
      name: "vboxnet0", :adapter => 2
    subconfig.vm.network "forwarded_port", guest: 33389, host: 9015
    subconfig.winrm.username = "vagrant"
    subconfig.winrm.password = "vagrant"
    subconfig.winrm.transport = :plaintext
    subconfig.winrm.basic_auth_only = true
    subconfig.vm.provision "shell",
      run: "always",
      inline: "route /p add 0.0.0.0 mask 0.0.0.0 192.168.11.1"
    subconfig.vm.provision "shell",
      path: "provision/ConfigureRebootOnNode.ps1"    
    subconfig.vm.provision "shell",
      path: "provision/PreDSCInstall.ps1"
    subconfig.vm.provision "shell",
      path: "provision/DSCJoinDomain.ps1"
  end
end
