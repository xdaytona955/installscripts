# Cloudify
/root/installscripts/startbase.sh
yum install python-pip python-virtualenv -y
yum install http://gigaspaces-repository-eu.s3.amazonaws.com/org/cloudify3/3.2.1/ga-RELEASE/cloudify-centos7-cli_3.2.1-ga-b212_x86_64.rpm -y
pip install --upgrade pip
python /cfy/get-cloudify.py
