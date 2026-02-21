# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'almalinux/9'
  config.vm.network :private_network, ip:"172.17.64.2"
  config.vm.provider('libvirt') do |vb|
    vb.video_type = "virtio"
    vb.memory = 1024 * 8
    vb.cpus = 4
  end
  config.vm.provision "shell", inline: <<-SHELL
    sudo dnf -y install make
    cd /vagrant && sudo make local
  SHELL
end

