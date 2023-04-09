#!/bin/bash
    
echo "Update with latest packages"
yum update -y
    
echo "Install Apache"
yum install -y httpd git
    
echo "Enable Apache service to start after reboot"
sudo systemctl enable httpd
    
echo "Install application"

echo "Check Point = Gabriel Montez - RM551095" > /var/www/html/index.html
  
    
echo "Start Apache service"
service httpd restart