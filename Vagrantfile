# vi: set ft=ruby:

class VM
  attr_accessor :hostname, :box, :cpus, :memory, :provisioner
  def initialize(options ={})
    self.hostname = options[:hostname]
    self.box = options[:box] || 'ubuntu/xenial64'
    self.cpus = options[:cpus] || '1'
    self.memory = options[:memory] || '512'
  end
end

nodes  = [
  VM.new(hostname: 'ansdev'), # option to use specific path with provisioner: path/to/file
]

Vagrant.configure("2") do |config|
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end
  nodes.each do |node|
    config.vm.define node.hostname do |node_config|
      node_config.vm.box = node.box
      node_config.vm.hostname = node.hostname
      node_config.vm.network :public_network
      node_config.vm.synced_folder ".", "/home/vagrant/shared"
      node_config.vm.provider :virtualbox do |vbox|
        vbox.name = node.hostname
        vbox.memory = node.memory
        vbox.cpus = node.cpus
      end
    end
  end
end
