#!/bin/bash
    
echo "Update with latest packages"
yum update -y
    
echo "Install Apache"
yum install -y httpd git
    
echo "Enable Apache service to start after reboot"
sudo systemctl enable httpd
    
echo "Install application"
cd /tmp
#git clone https://github.com/kledsonhugo/app-static-site-ec2
git clone https://github.com/rco3000/app-static-site-ec2.git
cp /tmp/app-static-site-ec2/app/*.html /var/www/html/
    
echo "Start Apache service"
service httpd restart