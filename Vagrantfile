 Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb. cpus = 1
    vb.gui = true
    vb.check_guest_additions = false
  end
   
  config.vm.define "bionic" do |bionic|
    bionic.vm.hostname = "bionic"
    bionic.vm.box = "generic/ubuntu1804"
    config.vm.provision "ansible" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "playbook.yaml"
  end
end

  config.vm.define "bullseye" do |bullseye|
      bullseye.vm.box = "debian/bullseye64"
      bullseye.ssh.insert_key = true
      bullseye.vm.hostname = "bullseye"
      bullseye.vm.boot_timeout = 600
      bullseye.vm.provision "shell",
        inline: "apt update && apt -y upgrade"
      config.vm.provision "ansible" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "playbook.yaml"

  config.vm.synced_folder '.', '/vagrant', disabled: true
  #Ez a bridge hálózatot hozza létre
  #config.vm.network "public_network"
  config.vm.network "private_network", type: "dhcp"
   end
  end
end