Vagrant.configure("2") do |config|
    # The most common configuration options are documented and commented below.
    # For a complete reference, please see the online documentation at
    # https://docs.vagrantup.com.
  
    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://vagrantcloud.com/search.
    config.vm.define "app" do |app|
      app.vm.box = "bento/ubuntu-20.04"
      app.vm.hostname = "app.host"
    
      app.vm.provision "shell", inline: <<-SHELL
        sudo apt update
        sudo apt -y install python3-pip
        python3 -m pip install ansible docker docker-compose
        cd /vagrant
        ansible-galaxy install -r ./provision/requirements.yml
      SHELL
      app.vm.provision "ansible" do |ansible|
        ansible.inventory_path = "provision/hosts"
        ansible.playbook = "provision/deploy.yml"
        ansible.groups = {
          "app" => ["app"]
        }
        # ansible.galaxy_role_file = "provision/requirements.yml"
        # ansible.verbose = "vvv"
      end
      config.vm.network "public_network", ip: "192.168.1.100"
    end
  
    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # config.vm.box_check_update = false
  
    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # NOTE: This will enable public access to the opened port
    # config.vm.network "forwarded_port", guest: 80, host: 8080
  
    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine and only allow access
    # via 127.0.0.1 to disable public access
    # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  
    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    # config.vm.network "private_network", ip: "192.168.33.10"
  
    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
  
    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    # config.vm.provider "virtualbox" do |vb|
    #   # Display the VirtualBox GUI when booting the machine
    #   vb.gui = true
    #
    #   # Customize the amount of memory on the VM:
    #   vb.memory = "1024"
    # end
   
  end