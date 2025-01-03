# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'almalinux/9'
  config.vm.provider (RUBY_PLATFORM =~ /darwin/ ? 'vmware_desktop' : 'libvirt') do |vb|
    vb.memory = 2048
    vb.cpus = 4
  end
  config.vm.provision :ansible_local do |ansible|
    ansible.playbook = "r.yml"
    ansible.become = true
  end
end

