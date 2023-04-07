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
        <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    </head>
    <body>
        <h3>Olá, professor.</h3>
        <h3>Bem vindo !</h3>
        <p></p>
        <p>Titio é foda mesmo e eu aprendi e consegui fazer o CP2!!!</p>
        <p>Obrigada pelos ensinamentos</p>
        <img src="https://i.pinimg.com/564x/bd/95/1b/bd951b5cda24c32866afe93783f419f7.jpg">
        <p></p>
    </body>
</html>
EOF

echo "Start Apache service"
service httpd restart