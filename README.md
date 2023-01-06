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