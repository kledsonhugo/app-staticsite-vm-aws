#!/bin/bash
    
# Update with latest packages
yum update -y
    
# Install Apache
yum install -y httpd git
    
# Enable Apache service to start after reboot
sudo systemctl enable httpd
    
# Install application
cd /tmp
git clone https://github.com/kledsonhugo/app-static-site-ec2
cp /tmp/static-site/app/*.html /var/www/html/
    
# Start Apache service
service httpd restart