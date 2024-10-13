# init

Ansible Recipe for Red Hat Enterprise Linux-based Distributions: Setting up a Work Environment with PXE Server Configuration, Ruby Installation, and More.

# Install

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/YumaYX/init/main/init.sh)"
```

# Functions(install)

- dot files
- ruby
  - dnf(root)
  - rbenv(user)
- httpd
- nfs server
- workspace
- kvm+vagrant(only on physical servers)
- pxe server

# Vagrantfile

Vagrantfile for Testing the init

# Version

- Rocky Linux release 9.3 (Blue Onyx)
- AlmaLinux release 9.4 (Seafoam Ocelot)
