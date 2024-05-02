# init

Ansible Recipe for Red Hat Enterprise Linux-based Distributions: Setting up a Work Environment with the Installation of Ruby, various servers, and additional tools.

# Usage

run the following command as root on Red Hat Enterprise Linux-based Distribution

```sh
curl -fsSL https://raw.githubusercontent.com/YumaYX/init/main/init.sh | sudo sh
```

or `curl -L bit.ly/startinit | sudo sh`

# Functions

installation of the following features

- dot files
- user
- ruby
  - dnf(root)
  - rbenv(user)
- python for Ansible
- workspace
- web server(httpd)
- nfs server

## on physical servers

- kvm + vagrant
- vscode

## option

- pxe server

# Vagrantfile

Vagrantfile for Testing the init

# Execution environment 

- AlmaLinux release 9.4 (Seafoam Ocelot)
- x86_64
