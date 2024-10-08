# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'almalinux/9'
  config.vm.provider 'libvirt' do |vb|
    vb.memory = 2048
    vb.cpus = 8
  end
  config.vm.provision :ansible_local do |ansible|
    ansible.playbook = "r.yml"
    ansible.become = true
  end
end

