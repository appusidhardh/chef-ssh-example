# Passwordless user cookbook
This cookbook creates a user named appu in the vagrant machine with ip 22.22.22.22 without passwod authentication. This will allow you to ssh into the machine with the user appu without provising any password. This works on based of key authentication.
# Cookbook explained
  - creating directory /home/appu
  - Screating directory ~/.ssh
  - create user appu with home /home/appu and shell /bin/bash
  - adding public key to the new user's .ssh/authorised_keys
  - restarting ssh service

### Version


### How to run 
 
 - Install vagrant
 >sudo apt-get install vagrant
 - configure vagrant
 >vagrant init
>vim Vagrantfile
- add the following to the Vagrant file 

>config.vm.provision :chef_solo do |chef|

>chef.add_recipe "test::default"

>chef.cookbooks_path = "./cookbooks"

>end

>config.vm.network "private_network", ip: "22.22.22.22"
 
- placing cookbooks
>mkdir cookbooks
- starting vagrant
>vagant up

- provisioning vagrant
>vagratn provision

- connecting to server 
>ssh appu@22.22.22.22

 
