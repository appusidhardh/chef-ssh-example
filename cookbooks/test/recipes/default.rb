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
  command 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7a8164RaPK3ts2S6KeU7Bhbbs6J8iQQQ9ahoZqOKK+TjEDaYSxBJCGLw8A9UsYZVCsYYUKnvGxDQYAYRJLcokR114dVCxF2z50llkO9rV54iCuzzHVMfKh14YQLTRuJCLedWC1qaqN16L+PMAEGJ/57oZtWjqbeMBLlBQJL7h+5LVdSH2AO+zIYDhhXbCq8Idtw5ywIrywBWxkRDCUXI5hyiVVhMn0b7sU4NKs+TKWIhlVx3fv76Q7by4rxqiVCyfDwlce35k1diSaMment4lT3f/6riEQyPTscjZ5ejxnQv+IIY5Z8bcc0a2cpzxrFAZvj4SrFXpE1djwczS83ON guest2@stsid">/home/appu/.ssh/authorized_keys'
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

