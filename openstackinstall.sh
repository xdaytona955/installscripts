#! /bin/bash
yum install -y https://www.rdoproject.org/repos/rdo-release.rpm
yum install -y openstack-packstack 
sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
service sshd restart
packstack --allinone

# Dashboard won't work unless we add the real IP to ServerAlias
echo "wget http://ipinfo.io/ip -qO - >> /tmp/myip.txt" >> /etc/rc.local
echo "sed -i 's/<\/VirtualHost>/#/g' /etc/httpd/conf.d/15-horizon_vhost.conf" >> /etc/rc.local
echo "cat /tmp/myip.txt | while read CMD; do echo ServerAlias $CMD; done >> /etc/httpd/conf.d/15-horizon_vhost.conf" >> /etc/rc.local

# line below does not work
echo "echo "<\/VirtualHost>" >> /etc/httpd/conf.d/15-horizon_vhost.conf" >> /etc/rc.local

echo "service httpd restart" >> /etc/rc.local
