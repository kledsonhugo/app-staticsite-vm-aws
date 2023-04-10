#!/bin/bash
    
echo "Update with latest packages"
yum update -y
    
echo "Install Apache"
yum install -y httpd git
    
echo "Enable Apache service to start after reboot"
sudo systemctl enable httpd
    
echo "Install application"
cd var/www/html/
touch index.html
echo -e "
<html>\n
    <head>\n
        <title>S3 Site</title>\n
        <meta http-equiv=Content-Type content=\"text/html; charset=utf-8\">\n
    </head>\n
    <body>\n
        <p>Olá.</p>\n
        <p>Bem vindo !!!!!!!!</p>\n
        <p></p>\n
        <p>Aqui você irá:</p>\n
        <ul>\n
        <li>aprender</li>\n
        <li>colaborar</li>\n
        <li>compartilhar</li>\n
        </ul>\n
        <p><b>Kledson Basso</b><br /><a href=\"https://www.linkedin.com/in/kledsonbasso/\">https://www.linkedin.com/in/kledsonbasso/</a></p>\n
        <p>Victor Lopes</p>\n
    </body>\n
</html>\n
" >> index.html
    
echo "Start Apache service"
service httpd restart