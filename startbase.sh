#! /bin/bash
# Standard Env
sed -i 's/Defaults    requiretty/#Defaults    requiretty/g' /etc/sudoers
echo alias vi='vim' >> /etc/bashrc
echo "wget http://ipinfo.io/ip -qO -" > /bin/whatsmyip
echo "sudo su -" > /bin/rootme
chmod +x /bin/whatsmyip /bin/rootme
yum install epel-release vim -y
yum install htop net-tools mlocate gcc wget  -y
yum update -y
Updatedb

