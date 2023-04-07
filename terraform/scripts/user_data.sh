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
        <title>Site Luiz Ricardo | RM 98150</title>
    </head>
    <body>
        <p>Olá Professor Kledson, tudo bem?</p>
        <p>Gostaria de mostrar para você o nosso grande idolo <b>Neymar Jr.</b> perdendo 5mil jogando poker:</p>
        <img src="https://p2.trrsf.com/image/fget/cf/774/0/images.terra.com/2023/03/29/neymar-chora-1jy4zched46ra.png" alt="Neymar">
    </body>
</html>
EOF
    
echo "Start Apache service"
service httpd restart