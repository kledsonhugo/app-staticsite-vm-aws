#!/bin/bash
    
echo "Update with latest packages"
yum update -y
    
echo "Install Apache"
yum install -y httpd git
    
echo "Enable Apache service to start after reboot"
sudo systemctl enable httpd
    
echo "Install application"
cd /tmp
git clone https://github.com/kledsonhugo/app-static-site-ec2
cp /tmp/app-static-site-ec2/app/*.html /var/www/html/
cat <<EOF > /var/www/html/index.html
<html>
    <head>
        <title>ola professor</title>
        <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    </head>
    <body>
        <p>voce sabia</p>
        <p>que</p>
        <p>eu estou</p>
        <p>sofrendo muito</p>
        
        <p>na sua materia? rsrs</p>
        
    </body>
</html>
EOF
    
echo "Start Apache service"
service httpd restart