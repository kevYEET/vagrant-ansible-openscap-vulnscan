 Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.cpus = 1
    vb.gui = true
    vb.check_guest_additions = false
  end
   
  config.vm.define "bionic" do |bionic|
    bionic.vm.box = "generic/ubuntu1804"
    bionic.vm.hostname = "bionic"
    bionic.ssh.insert_key = true
    config.vm.provision "ansible" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "playbook.yaml"
    end
  end

  config.vm.define "centos" do |centos|
      centos.vm.box = "centos/7"
      centos.ssh.insert_key = true
      centos.vm.hostname = "centos"
      centos.vm.boot_timeout = 600
      #It's just a bonus line, you van give inline commands in the vagrant file too
      centos.vm.provision "shell",
        inline: "yum update && yum -y upgrade"
      config.vm.provision "ansible" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "playbook.yaml"
      end
    end
  config.vm.synced_folder '.', '/vagrant', disabled: true #Disabling the folder sync is necessary because we are using WSL and the hypervisor is running on the host machine
  #This will create a bridge adapter if you need it
  #config.vm.network "public_network"
  config.vm.network "private_network", type: "dhcp" #A simple host-only card for manual ssh and scp
end