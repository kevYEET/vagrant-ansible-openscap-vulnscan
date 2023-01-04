# vagrant-ansible-openscap-vulnscan
## About
This page will show you how to install and use Vagrant, Ansible and OpenSCAP with a Windows host machine using WSL, but you can do the same with a VirtualMachine or any Linux distro as host system. You can automate the OpenSCAP scan too with a bash script which will run on the VM, then you can scp the report.html to check the results about your created system.
FYI: Make a snapshot or backup before you start patching any vulnerabilities!!!

## Vagrant Installation

Go to:
https://releases.hashicorp.com/vagrant/
Download .msi for windows and .deb for Ubuntu (If you are using another distro just pick the correct file)
You need to install vagrant on your WSL and Windows system either! Choose the most recent release!

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
The default Vagrant provider is VirtualBox,if you would like to use a different hypervisor you need to define it with the last command you can see in this example vmware_desktop.

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

## Other Settings
If you have no .ssh directory you must create it with the following:
```
$ mkdir -p ~/.ssh && chmod 700 ~%.ssh
$ touch ~/.ssh/config
$ chmod 600 ~/.ssh/config
```
Copy this into your .ssh/config file: 
```
Host 127.0.0.1
    PubkeyAcceptedKeyTypes +ssh-rsa
```