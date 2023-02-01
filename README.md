## About
To use Vagrant, Ansible, and OpenSCAP on a Windows host machine, you can follow the steps outlined in this page, which involve using WSL. Alternatively, you can use a virtual machine or any Linux distribution as your host system. You can also automate the OpenSCAP scan by creating a bash script that runs on the virtual machine, and then use scp to transfer the report.html file to check the results of the scan on your system. It is important to note that you should create a snapshot or backup before patching any vulnerabilities.

## Vagrant Installation

To install Vagrant on your WSL and Windows system, visit https://releases.hashicorp.com/vagrant/. There, you can download the .msi file for Windows and the .deb file for Ubuntu. If you are using a different distribution, simply select the correct file for your system. It is recommended to choose the most recent release.

```
$ wget https://releases.hashicorp.com/vagrant/2.3.4/vagrant_2.3.4-1_amd64.deb
$ sudo apt install vagrant_2.3.4-1_amd64.deb
```

After the installation edit .bashrc:
```
export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH=/mnt/c/Users/<UserName>

export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS=1

export VAGRANT_DEFAULT_PROVIDER=vmware_desktop
```
By default, Vagrant uses VirtualBox as its provider. If you wish to use a different hypervisor, you can specify it in the last command, as shown in the example with vmware_desktop.

Update and Check:
```
$ source .bashrc
$ printenv
```

## Ansible Installation

For more information check out the [Official Ansible Documentation](https://docs.ansible.com/)
```
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo add-apt-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible
```

Manual Installation:
```yum -y install openscap-scanner scap-security-guide```
On Debian based distros you will need to manually install the scap-security-guide from github and the scanner name as an apt package is **libopenscap8**

You will find the OpenSCAP security guidelines here:
```ls /usr/share/xml/scap/ssg/content/ ```
![results](../main/_resources/c851c0306f26f2eca89d4124fc262e3c.png)

## Other Settings
If you have no .ssh directory you must create it with the following:
```
$ mkdir -p ~/.ssh && chmod 700 ~/.ssh
$ touch ~/.ssh/config
$ chmod 600 ~/.ssh/config
```
Copy this into your .ssh/config file: 
```
Host 127.0.0.1
    PubkeyAcceptedKeyTypes +ssh-rsa
```
## This Vagrantfile will do the following:

   **Vagrant.configure("2"):** This line indicates that the Vagrantfile is using version 2 of the configuration syntax.

   **config.vm.provider "virtualbox":** This line specifies that the Vagrantfile will be using VirtualBox as the provider.
	
   **vb.memory = 1024:** This line sets the amount of memory allocated for the virtual machine to 1024MB.
   
   **vb.cpus = 1:** This line sets the number of CPU cores allocated for the virtual machine to 1.
   
   **vb.gui = true:** This line enables the VirtualBox GUI for the virtual machine.
   
   **vb.check_guest_additions = false:** This line disables the check for guest additions on the virtual machine.
   
   **config.vm.define "bionic":** This line creates a new virtual machine named "bionic".
  
   **bionic.vm.box = "generic/ubuntu1804":** This line specifies that the "bionic" virtual machine will be using the generic/ubuntu1804 box.
  
   **bionic.vm.hostname = "bionic":** This line sets the hostname of the "bionic" virtual machine to "bionic".
 
   **bionic.ssh.insert_key = true:** This line enables automatic key insertion for the "bionic" virtual machine, which allows you to use vagrant ssh without specifying a key.
   
   **config.vm.provision "ansible":** This line specifies that the "bionic" virtual machine will be provisioned with Ansible.
   
   **ansible.verbose = "v":** This line sets the Ansible provisioner to verbose mode, which will display more detailed output.
   
   **ansible.playbook = "playbook.yaml":** This line specifies the Ansible playbook that will be used to provision the "bionic" virtual machine.
   
   **config.vm.define "centos":** This line creates a new virtual machine named "centos".
   
   **centos.vm.box = "centos/7":** This line specifies that