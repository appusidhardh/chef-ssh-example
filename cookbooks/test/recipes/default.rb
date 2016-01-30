#
# Cookbook Name:: test
# Recipe:: default

execute 'makind home' do 
  command "mkdir -p /home/appu"
end
execute 'makind .ssh dir' do 
  command "mkdir -p /home/appu/.ssh"
end
user 'appu' do
 # comment 'A random user'
  home '/home/appu'
  shell '/bin/bash'
 password '$1$pBbWB/HB$NtLypftsWCwck75bayMY01'
end
#execute 'removing passwd' do 
#  command "passwd -d appu"
#end
execute 'adding new public key' do
  command 'echo "replace this string with public key">>/home/appu/.ssh/authorized_keys'
end
execute 'removing passowrd prompt' do
  command "sed -i  '/PermitEmptyPasswords/c\PermitEmptyPasswords yes' /etc/ssh/sshd_config"
end
#execute 'removing passowrd prompt' do
#  command "sed -i  '/#PasswordAuthentication/c\PasswordAuthentication no' /etc/ssh/sshd_config"
#end
execute 'restart sshd service' do
  command "service ssh restart"
end

