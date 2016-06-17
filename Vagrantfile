VAGRANTFILE_API_VERSION = '2'
Vagrant.require_version '>= 1.5.0'
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'myface-berkshelf'
  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = '12.10.24'
  end

  # Don't keep reinstalling virtualbox guest additions, it takes too
  # much time
  # vagrant plugin install vagrant-omnibus
  if Vagrant.has_plugin?('vagrant-vbguest')
    config.vbguest.auto_update = false
  end

  # Cache apt, rpm, gems, ... as much as I can to speed up testing
  if Vagrant.has_plugin?('vagrant-cachier')
    #    config.cache.auto_detect = true # prefer to be explicit
    config.cache.scope = :box
    config.cache.enable :pacman
    config.cache.enable :rvm
    config.cache.enable :chef
    config.cache.enable :yum
    config.cache.enable :apt
    config.cache.enable :gem
  end




  config.vm.box = 'bento/ubuntu-14.04'
  config.vm.network :private_network, type: 'dhcp'
  config.vm.provision :chef_zero do |chef|
    chef.nodes_path = "./nodes"
    chef.version = '12.10.24'
    chef.json = {
      mysql: {
        server_root_password: 'rootpass',
        server_debian_password: 'debpass',
        server_repl_password: 'replpass'
      }
    }
    chef.run_list = [
      'recipe[myface::default]'
    ]
  end
end
