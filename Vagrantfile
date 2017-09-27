
guest_port        = 80                    # Guest port
host_port         = 8080                 # Host port
vm_ram            = "512"                 # VM RAM
laravel_version   = "current"              # Laravel version >= "4.x.x" | "current"
app_laravel_name  = "api.bookmeforphotographers.com"      # Laravel app name
db_password       = "root"                # Database password
githubtoken       = "3648711456a1fb8c1038cf9c82c3b6c12b0e51c1"                    # Your github token

unless Vagrant.has_plugin?("vagrant-vbguest")
  raise 'vagrant-vbguest is not installed! - You can install it by typing "vagrant plugin install vagrant-vbguest"'
end

Vagrant.configure("2") do |config|

config.vm.define "nodeEnv" do |web1|
    # The famous hostname
    web1.vm.hostname = "nodeEnv"

    # Imagen de vagrant
    web1.vm.box = "primalskill/ubuntu-trusty64"

    # Network config
    web1.vm.network :forwarded_port, guest: guest_port, host: host_port, auto_correct: true
    web1.vm.network :forwarded_port, guest: 8000, host: 8000, auto_correct: true
    web1.vm.network :private_network, ip: "192.168.32.10"

    # Shared folder config
    web1.vm.synced_folder "./", "/var/www/", create: true, group: "www-data", owner: "vagrant", mount_options: ['dmode=777', 'fmode=666']

    # Name, id and VM's RAM memory
    web1.vm.provider "virtualbox" do |v|
      v.name = "nodeEnv"
      v.customize ["modifyvm", :id, "--memory", vm_ram]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--usbehci", "off"]
    end

    web1.vm.provision "shell", path: "provision/components/init.sh" , :args => ["expressApp"]

  end
end
