VAGRANTFILE_API_VERSION = '2'
Vagrant.require_version '>= 1.5.0'
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'myface-berkshelf'
  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = 'latest'
  end

  config.vm.box = 'bento/ubuntu-14.04'
  config.vm.network :private_network, type: 'dhcp'
  config.vm.provision :chef_solo do |chef|
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
