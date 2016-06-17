VAGRANTFILE_API_VERSION = '2'
Vagrant.require_version '>= 1.5.0'
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'myface-berkshelf'
  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.cache_packages = true
    config.omnibus.chef_version = '12.10.24'
  end

  # Don't keep reinstalling virtualbox guest additions, it takes too
  # much time
  # vagrant plugin install vagrant-omnibus
  if Vagrant.has_plugin?('vagrant-vbguest')
    config.vbguest.auto_update = false
  end

  config.vm.box = 'bento/ubuntu-14.04'
  config.vm.network :private_network, type: 'dhcp'
  config.vm.provision :chef_solo do |chef|
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
